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
import org.springframework.web.bind.annotation.RequestMapping;

import com.mima.app.medication.domain.PillSearchVO;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/medication/*")
public class MedicationController {
	
	// 약검색 페이지 [K]210929
	@GetMapping("/pillSearch")
	public void pillSearch() {
		
	}
	
	// 약 API 연결 페이지 [K]210929
	@RequestMapping("/pill")
	public void search(Model model) throws IOException { 		
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
        System.out.println(rd);
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = rd.readLine()) != null) {
            sb.append(line);
        }
        rd.close();
        conn.disconnect();
        
        // String -> JSON 변환
        JSONArray jArry = new JSONObject(new JSONObject(sb.toString()).get("body").toString()).getJSONArray("items");
        
        List<PillSearchVO> pList = new ArrayList<PillSearchVO>();
		// 객채에 담음
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
		model.addAttribute("plist", pList);
        
    }
	
	
	    
	
}
