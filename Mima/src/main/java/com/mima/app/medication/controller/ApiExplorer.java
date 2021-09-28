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
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.medication.domain.PillSearchVO;

import lombok.extern.java.Log;

@Log
@Controller
public class ApiExplorer {
	
	
	
	@RequestMapping("/pillsearch")
	public void search(PillSearchVO vo) throws IOException { 		
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
        urlBuilder.append("?" + URLEncoder.encode("ServiceKey","UTF-8") + "=kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D"); /*Service Key*/
        urlBuilder.append("&" + URLEncoder.encode("ServiceKey","UTF-8") + "=" + URLEncoder.encode("인증키(url encode)", "UTF-8")); /*공공데이터포털에서 받은 인증키*/
        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode("1", "UTF-8")); /*페이지번호*/
        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("3", "UTF-8")); /*한 페이지 결과 수*/
        urlBuilder.append("&" + URLEncoder.encode("entpName","UTF-8") + "=" + URLEncoder.encode("한미약품(주)", "UTF-8")); /*업체명*/
        urlBuilder.append("&" + URLEncoder.encode("type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*응답데이터 형식(xml/json) Default:xml*/
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
        // 전체 조회
        //System.out.println(sb.toString());
        //System.out.println("============================================");
        
        
        JSONArray jArry = new JSONObject(new JSONObject(sb.toString()).get("body").toString()).getJSONArray("items");
        /*
         * String value = sb.toString();
         * JSONObject firstJson = new JSONObject(value);
         * String bodyValue = firstJson.get("body").toString();
         * JSONObject twoJson = new JSONObject(bodyValue);
         * JSONArray jArry = towJson.getJSONArray("items");
         * System.out.println(jArry.getJSONObject(0));
		 * System.out.println("******************배열안에******************");
		 * System.out.println(jArry.getJSONObject(0).get("entpName"));
		 */
        System.out.println(jArry);
        List<PillSearchVO> pList = new ArrayList<PillSearchVO>();
		
		
		for (int i=0; i<jArry.length(); i++) {
			JSONObject JO = jArry.getJSONObject(i);
			PillSearchVO pill = new PillSearchVO();
			if(!JO.isNull("entpName")) { pill.setEntpName(String.valueOf(JO.get("entpName")));  }
			if(!JO.isNull("itemName")) { pill.setItemName(String.valueOf(JO.get("itemName"))); }
			if(!JO.isNull("itemSeq")) { pill.setItemSeq(Integer.parseInt(JO.get("itemSeq").toString())); }
			if(!JO.isNull("efcyQesitm")) { pill.setEfcyQesitm(String.valueOf(JO.get("efcyQesitm"))); }
			if(!JO.isNull("useMethodQesitm")) { pill.setUseMethodQesitm(String.valueOf(JO.get("useMethodQesitm"))); }
			if(!JO.isNull("atpnWarnQesit")) { pill.setAtpnWarnQesit(String.valueOf(JO.get("atpnWarnQesit"))); }
			if(!JO.isNull("atpnQesitm")) { pill.setAtpnQesitm(String.valueOf(JO.get("atpnQesitm"))); }
			if(!JO.isNull("seQesitm")) { pill.setSeQesitm(String.valueOf(JO.get("seQesitm"))); }
			if(!JO.isNull("depositMethodQesitm")) { pill.setDepositMethodQesitm(String.valueOf(JO.get("depositMethodQesitm"))); }
			if(!JO.isNull("openDe")) { pill.setOpenDe(String.valueOf(JO.get("openDe"))); }
			if(!JO.isNull("updateDe")) { pill.setUpdateDe(String.valueOf(JO.get("updateDe"))); }
			if(!JO.isNull("itemImage")) { pill.setItemlmage(String.valueOf(JO.get("itemImage"))); }
			pList.add(pill);
		}
		System.out.println("!!!!!!!!!!!!!최종 리스트!!!!!!!!!!!!!!!!!");
		System.out.println(pList);
        
        // vo에 결과값 담기
        
        /*
        //Response code: 200
        {"header":
        	{"resultCode":"00","resultMsg":"NORMAL SERVICE."},
         "body":
         	{"pageNo":1,"totalCount":69,"numOfRows":3,"items":
         		[
         	      {	  "entpName":"한미약품(주)",
         	    	  "itemName":"티어드롭점안액(포비돈)",
         	    	  "itemSeq":"200301820",
         	    	  "efcyQesitm":"<p>이 약은 건조한 눈, 하드콘택트렌즈 착용시에 사용합니다.<\/p>",
         	    	  "useMethodQesitm":"<p>1회 1~2방울 1일 4~5회 점안합니다.<\/p><p>증상에 따라 적절히 증감합니다.<\/p>",
         	    	  "atpnWarnQesitm":null,
         	    	  "atpnQesitm":"<p>치료 중에는 소프트콘택트렌즈의 착용을 피하십시오.<\/p><p>점안용으로만 사용하십시오.<\/p><p>오염을 방지하기 위해 될 수 있는 한 공동으로 사용하지 마십시오.<\/p>",
         	    	  "intrcQesitm":null,
         	    	  "seQesitm":"<p>매우 드물게 과민반응이 나타날 수 있습니다.<\/p>",
         	    	  "depositMethodQesitm":"<p>습기와 빛을 피해 실온에서 보관하십시오.<\/p><p>어린이의 손이 닿지 않는 곳에 보관하십시오.<\/p>",
         	    	  "openDe":"2021-01-29 00:00:00",
         	    	  "updateDe":"20210129",
         	    	  "itemImage":null
         	    	 },
         	      {	  "entpName":"한미약품(주)",
         	    	  "itemName":"스파부틴정100밀리그램(트리메부틴말레산염)",
         	    	  "itemSeq":"198100428",
         	    	  "efcyQesitm":"<p>이 약은 식도역류 및 열공헤르니아, 위 십이지장염, 위ㆍ십이지장궤양에 있어서의 소화기능이상 (복통, 소화불량,구역, 구토)과 과민성대장증후군 및 경련성 결장과 소아 질환(습관성 구토, 비감염성 장관 통과 장애(변비, 설사))에 사용합니다.<\/p>",
         	    	  "useMethodQesitm":"<p>성인은 1회 1~2정(100~200 mg) 1일 3회 식전에 복용합니다.<\/p><p>연령, 증상에 따라 적절히 증감합니다.<\/p>",
         	    	  "atpnWarnQesitm":null,
         	    	  "atpnQesitm":"<p>갈락토오스 불내성, Lapp 유당분해효소 결핍증 또는 포도당-갈락토오스 흡수장애 등의 유전적인 문제가 있는 환자는 이 약을 복용하지 마십시오.<\/p><p>이 약을 복용하기 전에 황색4호에 과민증 환자 또는 경험자, 임부 또는 임신하고 있을 가능성이 있는 여성 및 수유부는 의사 또는 약사와 상의하십시오.<\/p>",
         	    	  "intrcQesitm":null,
         	    	  "seQesitm":"<p>드물게 변비, 설사, 복명, 구역, 구토, 소화장애, 구갈, 구내마비감, 심계항진, 피로감, 졸음, 현기, 권태감, 두통, GOT, GPT상승이 나타날 수 있습니다.<\/p><p>드물게 발진 등이 나타나는 경우 복용을 즉각 중지하고 의사 또는 약사와 상의하십시오.<\/p>",
         	    	  "depositMethodQesitm":"<p>실온에서 보관하십시오.<\/p>",
         	    	  "openDe":"2021-01-29 00:00:00",
         	    	  "updateDe":"20210129",
         	    	  "itemImage":"https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/1MucEwTxVj2"
         	      	},
         	      {     "entpName":"한미약품(주)",
         	      		"itemName":"제텐씨정",
         	      		"itemSeq":"198501220",
         	      		"efcyQesitm":"<p>이 약은 육체피로, 임신ㆍ수유기, 병중ㆍ병후(병을 앓는 동안이나 회복 후)의 체력 저하 시, 노년기의 비타민 B1, B2, B6, C, E의 보급과 구각염, 구순염, 구내염, 설염, 습진, 피부염 증상의 완화, 햇빛,피부병 등에 의한 색소침착(기미, 주근깨)의 완화, 잇몸출혈·비출혈(코피) 예방과 아연의 보급에 사용합니다.<\/p>",
         	      		"useMethodQesitm":"<p>만 12세 이상 및 성인은 1회 1정씩, 1일 1회 식후에 복용합니다.<\/p>",
         	      		"atpnWarnQesitm":null,
         	      		"atpnQesitm":"<p>이 약에 과민증 환자, 만 12개월 미만의 젖먹이는 이 약을 복용하지 마십시오.<\/p><p>이 약을 복용하기 전에 임부 또는 임신하고 있을 가능성이 있는 여성 및 수유부, 미숙아, 유아, 고옥살산뇨증(뇨중에 과량의 수산염이 배설되는 상태), 심장ㆍ순환기계기능 장애, 신장장애, 저단백혈증, 통풍, 신장결석, 혈전성 소인이 있는 환자, 폴산이 부족한 환자, 황색4호에 과민증 환자 또는 경험자는 의사 또는 약사와 상의하십시오.<\/p><p>정해진 용법과 용량을 잘 지키십시오.<\/p><p>각종 요검사 시에 혈당의 검출을 방해할 수 있으며, 요를 황색으로 변하게 하여 임상검사치에 영향을 줄 수 있습니다.<\/p>",
         	      		"intrcQesitm":"<p>인산염, 칼슘염, 경구용 테트라사이클린계 제제, 제산제, 레보도파와 함께 복용하지 마십시오.<\/p><p>에스트로겐을 포함한 경구용 피임제, 항알도스테론제, 트리암테렌과 함께 복용 시 의사 또는 약사와 상의하십시오.<\/p><p>녹차, 홍차 등 탄닌을 함유하는 차는 복용중, 복용전후에는 피하십시오.<\/p>","seQesitm":"<p>위부불쾌감, 설사, 변비, 발진, 발적, 구역, 구토, 묽은 변, 위장관장애, 소화장애, 상복부통증, 저혈압, 폐부종, 생리가 예정보다 빨라지거나 양이 점점 많아지고, 출혈이 오래 지속 되는 경우 복용을 즉각 중지하고 의사 또는 약사와 상의하십시오.<\/p>",
         	      		"depositMethodQesitm":"<p>습기와 빛을 피해 실온에서 보관하십시오.<\/p><p>어린이의 손이 닿지 않는 곳에 보관하십시오.<\/p>",
         	      		"openDe":"2021-01-29 00:00:00",
         	      		"updateDe":"20210129",
         	      		"itemImage":"https://nedrug.mfds.go.kr/pbp/cmn/itemImageDownload/151732685268700094"
         	      	}]
         		}
        	}  // 데이터 끝  
        	*/
        
    }
	
}
