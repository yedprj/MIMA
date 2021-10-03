package com.mima.app.medication.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
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
	public List<PillSearchVO> search(@RequestBody PillSearchVO pvo, Model model) throws IOException { 
		System.out.println(pvo.getItemName());
		System.out.println(pvo.getItemSeq());
		System.out.println(pvo.getEfcyQesitm());
		System.out.println(pvo.getIntrcQesitm());
		String str = "";
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키(url encode)", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
        
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
        
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); 
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
        BufferedReader rd;
        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
            rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        } else {
            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
        }
        System.out.println(rd);
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        // String -> JSON 변환
        List<PillSearchVO> pList = new ArrayList<PillSearchVO>();
        System.out.println(sb.toString());
        String value = sb.toString();
        JSONObject firstJson = new JSONObject(value);
        String bodyValue = firstJson.get("body").toString();
        JSONObject twoJson = new JSONObject(bodyValue);
        
        if(twoJson.getInt("totalCount") == 0) {
        	pList = null;
        } else { 
        
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

		return pList;
        
    }
	
	// 약 API - DRUG 정보 조회 [K]211003
	@RequestMapping("/pillsearch2")
	public void search2(DurVO vo) throws IOException {
		
		StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1470000/DURPrdlstInfoService/getDurPrdlstInfoList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode("(주)한국글로벌제약", "UTF-8")); /*업체명*/
        urlBuilder.append("&" + URLEncoder.encode("itemName","UTF-8") + "=" + URLEncoder.encode("아스피도캡슐", "UTF-8")); /*품목명*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지 번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과수*/
        URL url = new URL(urlBuilder.toString());
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        conn.setRequestProperty("Content-type", "application/json");
        System.out.println("Response code: " + conn.getResponseCode());
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
        System.out.println(sb.toString());
        
        List<DurVO> pList = new ArrayList<DurVO>();
        System.out.println(sb.toString());
        String value = sb.toString();
        JSONObject firstJson = new JSONObject(value);
        String bodyValue = firstJson.get("body").toString();
        JSONObject twoJson = new JSONObject(bodyValue);
        
        if(twoJson.getInt("totalCount") == 0) {
        	pList = null;
        } else { 
        
        JSONArray jArry = twoJson.getJSONArray("items");
        }
        
    
	}
		
	
	    
	
}
