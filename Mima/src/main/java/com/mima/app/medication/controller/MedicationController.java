package com.mima.app.medication.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mima.app.criteria.domain.Criteria;
import com.mima.app.criteria.domain.PageVO;
import com.mima.app.medication.domain.ApiPageVO;
import com.mima.app.medication.domain.DurDangerVO;
import com.mima.app.medication.domain.DurVO;
import com.mima.app.medication.domain.PillSearchVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/medication/*")
public class MedicationController {
	
	// 약검색 페이지 [K]211001
	@GetMapping("/pillSearch")
	public void pillSearch(Model model) {	}
	
	// 약 API - e약은요 [K]210929
	@PostMapping("/pill")
	@ResponseBody
	public HashMap<String, Object> search(@RequestBody PillSearchVO pvo, Model model) throws IOException { 
		Criteria cri = new Criteria();
		
		log.info(pvo.getItemName());
		log.info(pvo.getEfcyQesitm());
		log.info(pvo.getIntrcQesitm());
		String str = "";
		cri.setPageNum(pvo.getPageNo());
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키(url encode)", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        
        if(pvo.getItemName() != null) { 
        	str = pvo.getItemName();
        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*제품명*/
		}
        else if (pvo.getItemSeq() != 0 ) {
			str = String.valueOf(pvo.getItemSeq());
			urlBuilder.append("&" + URLEncoder.encode("itemSeq","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*품목기준코드*/
		}
        else if (pvo.getEfcyQesitm() != null ) {
			str = pvo.getEfcyQesitm();
			urlBuilder.append("&" + URLEncoder.encode("efcyQesitm","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*이 약의 효능은 무엇입니까?*/
		}
        else if (pvo.getIntrcQesitm() != null ) {
			str = pvo.getIntrcQesitm();
			urlBuilder.append("&" + URLEncoder.encode("intrcQesitm","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*이 약을 사용하는 동안 주의해야 할 약 또는 음식은 무엇입니까?*/
		}        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(cri.getPageNum()), "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        log.info(rd.toString());
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        
        // String -> JSON 변환
        List<PillSearchVO> pList = new ArrayList<PillSearchVO>();
        log.info(sb.toString());
        String value = sb.toString();
        JSONObject firstJson = new JSONObject(value);
        String bodyValue = firstJson.get("body").toString();
        JSONObject twoJson = new JSONObject(bodyValue);
        
        // 페이징처리 2
        PageVO pageVO = new PageVO(cri, twoJson.getInt("totalCount"));
        
        if(twoJson.getInt("totalCount") == 0) {
        	pList = null;
        } else { 
        
        
        // 결과값
        JSONArray jArry = twoJson.getJSONArray("items");
        
		// 객채에 담음
			for (int i=0; i<jArry.length(); i++) {
				JSONObject JO = jArry.getJSONObject(i);
				PillSearchVO pill = new PillSearchVO();
				if(!JO.isNull("entpName")) { pill.setEntpName(String.valueOf(JO.get("entpName")));  }
				if(!JO.isNull("itemName")) { pill.setItemName(String.valueOf(JO.get("itemName"))); }
				if(!JO.isNull("itemSeq")) { pill.setItemSeq(Integer.parseInt(JO.get("itemSeq").toString())); }
				if(!JO.isNull("efcyQesitm")) { pill.setEfcyQesitm(String.valueOf(JO.get("efcyQesitm"))); }
				if(!JO.isNull("useMethodQesitm")) { pill.setUseMethodQesitm(String.valueOf(JO.get("useMethodQesitm"))); }
				if(!JO.isNull("atpnWarnQesit")) { pill.setAtpnWarnQesitm(String.valueOf(JO.get("atpnWarnQesit"))); }
				if(!JO.isNull("atpnQesitm")) { pill.setAtpnQesitm(String.valueOf(JO.get("atpnQesitm"))); }
				if(!JO.isNull("seQesitm")) { pill.setSeQesitm(String.valueOf(JO.get("seQesitm"))); }
				if(!JO.isNull("depositMethodQesitm")) { pill.setDepositMethodQesitm(String.valueOf(JO.get("depositMethodQesitm"))); }
				if(!JO.isNull("openDe")) { pill.setOpenDe(String.valueOf(JO.get("openDe"))); }
				if(!JO.isNull("updateDe")) { pill.setUpdateDe(String.valueOf(JO.get("updateDe"))); }
				if(!JO.isNull("itemImage")) { pill.setItemImage(String.valueOf(JO.get("itemImage"))); }
				pList.add(pill);
			} 
		}
        hashMap.put("list", pList);
        hashMap.put("pageMaker",pageVO);
		return hashMap;
        
    }
	
	
	// 약 API - DRUG 정보 조회 [K]211004
	@PostMapping("/dur")
	@ResponseBody
	public HashMap<String, Object> search(@RequestBody DurVO dvo, Model model) throws IOException {
		Criteria cri = new Criteria();
		cri.setPageNum(dvo.getPageNo());
		String str = "";
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1470000/DURPrdlstInfoService/getDurPrdlstInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        if(dvo.getItemName() != null) { 
        	str = dvo.getItemName();
        	urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*품목명*/
		}
        else if (dvo.getEntpName() != null ) {
			str = String.valueOf(dvo.getEntpName());
			urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*업체명*/
		}
        
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(cri.getPageNum()), "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        List<DurVO> dList = new ArrayList<DurVO>();
        log.info(sb.toString());
        String value = sb.toString();
        JSONObject firstJson = new JSONObject(value);
        String bodyValue = firstJson.get("body").toString();
        JSONObject twoJson = new JSONObject(bodyValue);
        
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        
        PageVO pageVO = new PageVO(cri, twoJson.getInt("totalCount"));
        
        if(twoJson.getInt("totalCount") == 0) {
        	dList = null;
        } else { 
        
        JSONArray jArry = twoJson.getJSONArray("items");
        
		// 객채에 담음
			for (int i=0; i<jArry.length(); i++) {
				JSONObject JO = jArry.getJSONObject(i);
				DurVO dur = new DurVO();
				if(!JO.isNull("ITEM_SEQ")) { dur.setItemSeq(String.valueOf(JO.get("ITEM_SEQ")));}
				if(!JO.isNull("ITEM_NAME")) { dur.setItemName(String.valueOf(JO.get("ITEM_NAME")));}
				if(!JO.isNull("ENTP_NAME")) { dur.setEntpName(String.valueOf(JO.get("ENTP_NAME")));}
				if(!JO.isNull("ITEM_PERMIT_DATE")) { dur.setItemPermitDate(String.valueOf(JO.get("ITEM_PERMIT_DATE")));}
				if(!JO.isNull("ETC_OTC_CODE")) { dur.setEtcOtcCode(String.valueOf(JO.get("ETC_OTC_CODE")));}
				if(!JO.isNull("CLASS_NO")) { dur.setClassNo(String.valueOf(JO.get("CLASS_NO")));}
				if(!JO.isNull("CHART")) { dur.setChart(String.valueOf(JO.get("CHART")));}
				if(!JO.isNull("BAR_CODE")) { dur.setBarCode(String.valueOf(JO.get("BAR_CODE")));}
				if(!JO.isNull("MATERIAL_NAME")) { dur.setMaterialName(String.valueOf(JO.get("MATERIAL_NAME")));}
				if(!JO.isNull("EE_DOC_ID")) { dur.setEeDocId(String.valueOf(JO.get("EE_DOC_ID")));}
				if(!JO.isNull("UD_DOC_ID")) { dur.setUdDocId(String.valueOf(JO.get("UD_DOC_ID")));}
				if(!JO.isNull("NB_DOC_ID")) { dur.setNbDocId(String.valueOf(JO.get("NB_DOC_ID")));}
				if(!JO.isNull("INSERT_FILE")) { dur.setInsertFile(String.valueOf(JO.get("INSERT_FILE")));}
				if(!JO.isNull("STORAGE_METHOD")) { dur.setStorageMethod(String.valueOf(JO.get("STORAGE_METHOD")));}
				if(!JO.isNull("VALID_TERM")) { dur.setValidTerm(String.valueOf(JO.get("VALID_TERM")));}
				if(!JO.isNull("REEXAM_TARGET")) { dur.setReexamTarger(String.valueOf(JO.get("REEXAM_TARGET")));}
				if(!JO.isNull("REEXAM_DATE")) { dur.setReexamDate(String.valueOf(JO.get("REEXAM_DATE")));}
				if(!JO.isNull("PACK_UNIT")) { dur.setPackUnit(String.valueOf(JO.get("PACK_UNIT")));}
				if(!JO.isNull("CANCEL_DATE")) { dur.setCancelDate(String.valueOf(JO.get("CANCEL_DATE")));}
				if(!JO.isNull("CANCEL_NAME")) { dur.setCancelName(String.valueOf(JO.get("CANCEL_NAME")));}
				if(!JO.isNull("CHANGE_DATE")) { dur.setChangeDate(String.valueOf(JO.get("CHANGE_DATE")));}
				dList.add(dur);
			} 
		}

        hashMap.put("list", dList);
        hashMap.put("pageMaker",pageVO);
		return hashMap;
		
	}    
	
	// 약 병용금기 검색 페이지 [K]211004
	@PostMapping("/durDanger")
	@ResponseBody
	public HashMap<String, Object> search(@RequestBody DurDangerVO ddvo, Model model) throws IOException {	
		Criteria cri = new Criteria();
		cri.setPageNum(ddvo.getPageNo());
		String str = "";
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1470000/DURPrdlstInfoService/getUsjntTabooInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        
        if(ddvo.getTypeName() != null) { 
        	str = ddvo.getTypeName();
        	urlBuilder.append("&" + URLEncoder.encode("typeName","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*DUR유형*/
		}
        else if (ddvo.getIngrCode() != null ) {
			str = String.valueOf(ddvo.getIngrCode());
			urlBuilder.append("&" + URLEncoder.encode("ingrCode","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*DUR성분코드*/
		}
        else if (ddvo.getItemName() != null ) {
			str = ddvo.getItemName();
			urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode(str, "UTF-8")); /*품목명*/
        } 
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(cri.getPageNum()), "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8"));
        
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        log.info("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        List<DurDangerVO> ddList = new ArrayList<DurDangerVO>();
        
        
        log.info(sb.toString());
        String value = sb.toString();
        JSONObject firstJson = new JSONObject(value);
        String bodyValue = firstJson.get("body").toString();
        JSONObject twoJson = new JSONObject(bodyValue);
        
        HashMap<String, Object> hashMap = new HashMap<String, Object>();
        
        PageVO pageVO = new PageVO(cri, twoJson.getInt("totalCount"));
        
        if(twoJson.getInt("totalCount") == 0) {
        	ddList = null;
        } else { 
        
        JSONArray jArry = twoJson.getJSONArray("items");
        
		// 객채에 담음
			for (int i=0; i<jArry.length(); i++) {
				JSONObject JO = jArry.getJSONObject(i);
				DurDangerVO dur = new DurDangerVO();
				if(!JO.isNull("DUR_SEQ")) { dur.setDurSeq(String.valueOf(JO.get("DUR_SEQ"))); } 
				if(!JO.isNull("TYPE_CODE")) { dur.setTypeCode(String.valueOf(JO.get("TYPE_CODE"))); }
				if(!JO.isNull("TYPE_NAME")) { dur.setTypeName(String.valueOf(JO.get("TYPE_NAME"))); } 
				if(!JO.isNull("MIX")) { dur.setMix(String.valueOf(JO.get("MIX"))); } 
				if(!JO.isNull("INGR_CODE")) {dur.setIngrCode(String.valueOf(JO.get("INGR_CODE"))); }
				if(!JO.isNull("INGR_KOR_NAME")) { dur.setIngrKorName(String.valueOf(JO.get("INGR_KOR_NAME"))); }
				if(!JO.isNull("INGR_ENG_NAME")) { dur.setIngrEngName(String.valueOf(JO.get("INGR_ENG_NAME"))); }
				if(!JO.isNull("MIX_INGR")) { dur.setMixIngr(String.valueOf(JO.get("MIX_INGR"))); }
				if(!JO.isNull("ITEM_SEQ")) { dur.setItemSeq(String.valueOf(JO.get("ITEM_SEQ"))); }
				if(!JO.isNull("ITEM_NAME")) { dur.setItemName(String.valueOf(JO.get("ITEM_NAME"))); }
				if(!JO.isNull("ENTP_NAME")) { dur.setEntpName(String.valueOf(JO.get("ENTP_NAME"))); }
				if(!JO.isNull("CHART")) { dur.setChart(String.valueOf(JO.get("CHART"))); }
				if(!JO.isNull("FORM_CODE")) { dur.setFormCode(String.valueOf(JO.get("FORM_CODE"))); }
				if(!JO.isNull("ETC_OTC_CODE")) { dur.setEtcOtcCode(String.valueOf(JO.get("ETC_OTC_CODE"))); }
				if(!JO.isNull("CLASS_CODE")) { dur.setClassCode(String.valueOf(JO.get("CLASS_CODE"))); }
				if(!JO.isNull("FORM_NAME")) { dur.setFormName(String.valueOf(JO.get("FORM_NAME"))); }
				if(!JO.isNull("ETC_OTC_NAME")) { dur.setEtcOtcName(String.valueOf(JO.get("ETC_OTC_NAME"))); }
				if(!JO.isNull("CLASS_NAME")) { dur.setClassName(String.valueOf(JO.get("CLASS_NAME"))); }
				if(!JO.isNull("MAIN_INGR")) { dur.setMainIngr(String.valueOf(JO.get("MAIN_INGR"))); }
				if(!JO.isNull("MIXTURE_DUR_SEQ")) { dur.setMixTureDurSeq(String.valueOf(JO.get("MIXTURE_DUR_SEQ"))); }
				if(!JO.isNull("MIXTURE_MIX")) { dur.setMixTureMix(String.valueOf(JO.get("MIXTURE_MIX"))); }
				if(!JO.isNull("MIXTURE_INGR_CODE")) { dur.setMixTureIngrCode(String.valueOf(JO.get("MIXTURE_INGR_CODE"))); }
				if(!JO.isNull("MIXTURE_INGR_KOR_NAME")) { dur.setMixTureIngrKorName(String.valueOf(JO.get("MIXTURE_INGR_KOR_NAME"))); }
				if(!JO.isNull("MIXTURE_INGR_ENG_NAME")) { dur.setMixTureIngrEngName(String.valueOf(JO.get("MIXTURE_INGR_ENG_NAME"))); }
				if(!JO.isNull("MIXTURE_ITEM_SEQ")) { dur.setMixTureItemSeq(String.valueOf(JO.get("MIXTURE_ITEM_SEQ"))); }
				if(!JO.isNull("MIXTURE_ITEM_NAME")) { dur.setMixTureItemName(String.valueOf(JO.get("MIXTURE_ITEM_NAME"))); }
				if(!JO.isNull("MIXTURE_ENTP_NAME")) { dur.setMixTureEntpName(String.valueOf(JO.get("MIXTURE_ENTP_NAME"))); }
				if(!JO.isNull("MIXTURE_FORM_CODE")) { dur.setMixTureFormCode(String.valueOf(JO.get("MIXTURE_FORM_CODE"))); }
				if(!JO.isNull("MIXTURE_ETC_OTC_CODE")) { dur.setMixTureEtcOtcCode(String.valueOf(JO.get("MIXTURE_FORM_CODE"))); }
				if(!JO.isNull("MIXTURE_CLASS_CODE")) { dur.setMixTureClassCode(String.valueOf(JO.get("MIXTURE_CLASS_CODE"))); }
				if(!JO.isNull("MIXTURE_FORM_NAME")) { dur.setMixTureFormName(String.valueOf(JO.get("MIXTURE_FORM_NAME"))); }
				if(!JO.isNull("MIXTURE_ETC_OTC_NAME")) { dur.setMixTureEtcOtcName(String.valueOf(JO.get("MIXTURE_ETC_OTC_NAME"))); }
				if(!JO.isNull("MIXTURE_CLASS_NAME")) { dur.setMixTureClassName(String.valueOf(JO.get("MIXTURE_CLASS_NAME"))); }
				if(!JO.isNull("MIXTURE_MAIN_INGR")) { dur.setMixTureMainIngr(String.valueOf(JO.get("MIXTURE_MAIN_INGR"))); }
				if(!JO.isNull("NOTIFICATION_DATE")) { dur.setNotificationDate(String.valueOf(JO.get("NOTIFICATION_DATE"))); }
				if(!JO.isNull("PROHBT_CONTENT")) { dur.setProhbtContent(String.valueOf(JO.get("PROHBT_CONTENT"))); }
				if(!JO.isNull("REMARK")) { dur.setRemart(String.valueOf(JO.get("REMARK"))); }
				if(!JO.isNull("ITEM_PERMIT_DATE")) { dur.setItemPermitDate(String.valueOf(JO.get("ITEM_PERMIT_DATE"))); }
				if(!JO.isNull("MIXTURE_ITEM_PERMIT_DATE")) { dur.setMixTureItemPermitDate(String.valueOf(JO.get("MIXTURE_ITEM_PERMIT_DATE"))); } 
				if(!JO.isNull("MIXTURE_CHART")) { dur.setMixTureChart(String.valueOf(JO.get("MIXTURE_CHART"))); }
				ddList.add(dur);
			} 
		}

        hashMap.put("list", ddList);
        hashMap.put("pageMaker",pageVO);
		return hashMap;
        
	}
	
	
	
	
	
	
	/*
	 * if(!JO.isNull("DUR_SEQ")) { dur.setDurSeq(String.valueOf(JO.get("DUR_SEQ")));
	 * } if(!JO.isNull("TYPE_CODE")) {
	 * dur.setTypeCode(String.valueOf(JO.get("TYPE_CODE"))); }
	 * if(!JO.isNull("TYPE_NAME")) {
	 * dur.setTypeName(String.valueOf(JO.get("TYPE_NAME"))); } if(!JO.isNull("MIX"))
	 * { dur.setMix(String.valueOf(JO.get("MIX"))); } if(!JO.isNull("INGR_CODE")) {
	 * dur.setIngrCode(String.valueOf(JO.get("INGR_CODE"))); }
	 * if(!JO.isNull("INGR_KOR_NAME")) {
	 * dur.setIngrKorName(String.valueOf(JO.get("INGR_CODE"))); }
	 * if(!JO.isNull("INGR_ENG_NAME")) {
	 * dur.setIngrEngName(String.valueOf(JO.get("INGR_ENG_NAME"))); }
	 * if(!JO.isNull("MIX_INGR")) {
	 * dur.setMixIngr(String.valueOf(JO.get("MIX_INGR"))); }
	 * if(!JO.isNull("ITEM_SEQ")) {
	 * dur.setItemSeq(String.valueOf(JO.get("ITEM_SEQ"))); }
	 * if(!JO.isNull("ITEM_NAME")) {
	 * dur.setItemName(String.valueOf(JO.get("ITEM_NAME"))); }
	 * if(!JO.isNull("ENTP_NAME")) {
	 * dur.setEntpName(String.valueOf(JO.get("ENTP_NAME"))); }
	 * if(!JO.isNull("CHART")) { dur.setChart(String.valueOf(JO.get("CHART"))); }
	 * if(!JO.isNull("FORM_CODE")) {
	 * dur.setFormCode(String.valueOf(JO.get("FORM_CODE"))); }
	 * if(!JO.isNull("ETC_OTC_CODE")) {
	 * dur.setEtcOtcCode(String.valueOf(JO.get("ETC_OTC_CODE"))); }
	 * if(!JO.isNull("CLASS_CODE")) {
	 * dur.setClassCode(String.valueOf(JO.get("CLASS_CODE"))); }
	 * if(!JO.isNull("FORM_NAME")) {
	 * dur.setFormName(String.valueOf(JO.get("FORM_NAME"))); }
	 * if(!JO.isNull("ETC_OTC_NAME")) {
	 * dur.setEtcOtcName(String.valueOf(JO.get("ETC_OTC_NAME"))); }
	 * if(!JO.isNull("CLASS_NAME")) {
	 * dur.setClassName(String.valueOf(JO.get("CLASS_NAME"))); }
	 * if(!JO.isNull("MAIN_INGR")) {
	 * dur.setMainIngr(String.valueOf(JO.get("MAIN_INGR"))); }
	 * if(!JO.isNull("MIXTURE_DUR_SEQ")) {
	 * dur.setMixTureDurSeq(String.valueOf(JO.get("MIXTURE_DUR_SEQ"))); }
	 * if(!JO.isNull("MIXTURE_MIX")) {
	 * dur.setMixTureMix(String.valueOf(JO.get("MIXTURE_MIX"))); }
	 * if(!JO.isNull("MIXTURE_INGR_CODE")) {
	 * dur.setMixTureIngrCode(String.valueOf(JO.get("MIXTURE_INGR_CODE"))); }
	 * if(!JO.isNull("MIXTURE_INGR_KOR_NAME")) {
	 * dur.setMixTureIngrKorName(String.valueOf(JO.get("MIXTURE_INGR_KOR_NAME"))); }
	 * if(!JO.isNull("MIXTURE_INGR_ENG_NAME")) {
	 * dur.setMixTureIngrEngName(String.valueOf(JO.get("MIXTURE_INGR_ENG_NAME"))); }
	 * if(!JO.isNull("MIXTURE_ITEM_SEQ")) {
	 * dur.setMixTureItemSeq(String.valueOf(JO.get("MIXTURE_ITEM_SEQ"))); }
	 * if(!JO.isNull("MIXTURE_ITEM_NAME")) {
	 * dur.setMixTureItemName(String.valueOf(JO.get("MIXTURE_ITEM_NAME"))); }
	 * if(!JO.isNull("MIXTURE_ENTP_NAME")) {
	 * dur.setMixTureEntpName(String.valueOf(JO.get("MIXTURE_ENTP_NAME"))); }
	 * if(!JO.isNull("MIXTURE_FORM_CODE")) {
	 * dur.setMixTureFormCode(String.valueOf(JO.get("MIXTURE_FORM_CODE"))); }
	 * if(!JO.isNull("MIXTURE_ETC_OTC_CODE")) {
	 * dur.setMixTureEtcOtcCode(String.valueOf(JO.get("MIXTURE_FORM_CODE"))); }
	 * if(!JO.isNull("MIXTURE_CLASS_CODE")) {
	 * dur.setMixTureClassCode(String.valueOf(JO.get("MIXTURE_CLASS_CODE"))); }
	 * if(!JO.isNull("MIXTURE_FORM_NAME")) {
	 * dur.setMixTureFormName(String.valueOf(JO.get("MIXTURE_FORM_NAME"))); }
	 * if(!JO.isNull("MIXTURE_ETC_OTC_NAME")) {
	 * dur.setMixTureEtcOtcName(String.valueOf(JO.get("MIXTURE_ETC_OTC_NAME"))); }
	 * if(!JO.isNull("MIXTURE_CLASS_NAME")) {
	 * dur.setMixTureClassName(String.valueOf(JO.get("MIXTURE_CLASS_NAME"))); }
	 * if(!JO.isNull("MIXTURE_MAIN_INGR")) {
	 * dur.setMixTureMainIngr(String.valueOf(JO.get("MIXTURE_MAIN_INGR"))); }
	 * if(!JO.isNull("NOTIFICATION_DATE")) {
	 * dur.setNotificationDate(String.valueOf(JO.get("NOTIFICATION_DATE"))); }
	 * if(!JO.isNull("PROHBT_CONTENT")) {
	 * dur.setProhbtContent(String.valueOf(JO.get("PROHBT_CONTENT"))); }
	 * if(!JO.isNull("REMARK")) { dur.setRemart(String.valueOf(JO.get("REMARK"))); }
	 * if(!JO.isNull("ITEM_PERMIT_DATE")) {
	 * dur.setItemPermitDate(String.valueOf(JO.get("ITEM_PERMIT_DATE"))); }
	 * if(!JO.isNull("MIXTURE_ITEM_PERMIT_DATE")) {
	 * dur.setMixTureItemPermitDate(String.valueOf(JO.get("MIXTURE_ITEM_PERMIT_DATE"
	 * ))); } if(!JO.isNull("MIXTURE_CHART")) {
	 * dur.setMixTureChart(String.valueOf(JO.get("MIXTURE_CHART"))); }
	 */
	
	
}
