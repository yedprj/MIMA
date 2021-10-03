package com.mima.app.pharmacy.controller;




import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mima.app.member.domain.MemberVO;
import com.mima.app.member.service.MemberService;
import com.mima.app.pharmacy.domain.PartnerPharmacyVO;
import com.mima.app.pharmacy.domain.PhaDataVO;
import com.mima.app.pharmacy.service.PatnerPharmacyService;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping("/pharmacy/*")
public class PartnerPharmacyController {
	
	@Autowired PatnerPharmacyService partPhaService;
	@Autowired MemberService memberSerivce;
	
	// 약국 대쉬보드 [K]210929 
	@GetMapping("/pharmacyDash")
	public void pharmacyDash(PartnerPharmacyVO vo, Model model, HttpServletRequest request) {
		/*
		 * HttpSession session = request.getSession();
		 * log.info(session.getAttribute("session").toString()); MemberVO mvo =
		 * (MemberVO) session.getAttribute("session");
		 * log.info("*************"+mvo.getName());
		 */
		model.addAttribute("profile", partPhaService.selectOne(vo));
	}
	
	// 약배달 관리페이지 [K]210929
	@GetMapping("/medDelivery")
	public void medDelivery() {}
	
	// 복약지도 관리페이지 [K]210929
	@GetMapping("/medGuid")
	public void medGuid() {}
	
	// 프로필 페이지 [K]210929
	@GetMapping("/myProfile")
	public void myProfile(PartnerPharmacyVO vo, Model model) {
		model.addAttribute("profile", partPhaService.selectOne(vo));
	}
	
	// 프로필 수정 - ajax [K]210929
	@PutMapping("/profileUpdate")
	@ResponseBody
	public int profileUpdate(@RequestBody PartnerPharmacyVO vo, Model model) {
		return partPhaService.profileUpdate(vo);
	}
	
	// 리뷰페이지 [K]210929
	@GetMapping("/review")
	public void review() {}

	// 비밀번호 변경페이지 [K]210929
	@GetMapping("/pwUpdate")
	public void pwConfirmPage(PartnerPharmacyVO vo, Model model, HttpServletRequest request) {
		
		model.addAttribute("memberNo", vo.getMemberNo());
	}
	
	// 현재 비밀번호 확인페이지 [K]210929
	@PostMapping("/pwConfirm")
	@ResponseBody
	public MemberVO pwConfirm(@RequestBody MemberVO vo, Model model,HttpServletRequest request) {
		
		return  memberSerivce.memberLogin(vo);
	}
	
	
	
	// 파일 
	
	// Ajax
	@PostMapping("/uploadAjaxAction")
	@ResponseBody
	public List<PhaDataVO> uploadAjaxAction(MultipartFile[] upLoadFile, PhaDataVO vo) throws IllegalStateException, IOException{
		// 첨부파일 부분
		List<PhaDataVO> list = new ArrayList<PhaDataVO>();
		String path = "c:/upload";
		for (int i = 0; i < upLoadFile.length; i++) {
			MultipartFile ufile = upLoadFile[i];
			if (!ufile.isEmpty() && ufile.getSize() > 0) {
				String fileName = ufile.getOriginalFilename();
				UUID uuid = UUID.randomUUID();
				File file = new File(path, uuid + fileName);
				ufile.transferTo(file); // 실제위치로 전송
				// 파일정보
				PhaDataVO attachvo = new PhaDataVO();
				/*
				 * attachvo.setid.toString()); 
				 * attachvo.setFileName(fileName);
				 * attachvo.setUploadPath(path); 
				 * list.add(attachvo);
				 */
			}
		}
		return list;
	}
	
	/*
	 * @RequestMapping("/pharmacyApi") public void pharmacyApi() throws IOException
	 * {
	 * 
	 * String url
	 * ="http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown";
	 * String serviceKey =
	 * "kOfUtJpoB2nNx7jaI6XEcYuKUkswBceaC1lOvwdoLaEHRjjQvgNkQwOs%2Fh3MhO%2FWHv8%2BuL0zs6LKHuXP%2Bs2qhQ%3D%3D";
	 * String decodeServiceKey = URLDecoder.decode(serviceKey,"UTF-8"); String
	 * pageNo = "1"; String numbOfRows = "23414";
	 * 
	 * try { Document documentInfo = DocumentBuilderFactory.newInstance()
	 * .newDocumentBuilder() .parse(url + "?serviceKey=" + serviceKey + "&pageNo="+
	 * pageNo + "&numOfRows=" + numbOfRows);
	 * 
	 * documentInfo.getDocumentElement().normalize();
	 * 
	 * // 파싱 NodeList nList = documentInfo.getElementsByTagName("item"); for(int
	 * temp=0; temp < nList.getLength(); temp++) { Node nNode = nList.item(temp);
	 * if(nNode.getNodeType() == Node.ELEMENT_NODE) { Element eElement = (Element)
	 * nNode; System.out.println("약국주소:"+getTagValue("dutyAddr",eElement));
	 * 
	 * System.out.println("약국주소:"+getTagValue("dutyTel1",eElement));
	 * System.out.println("좌표1:"+getTagValue("wgs84Lat",eElement));
	 * System.out.println("좌표2:"+getTagValue("wgs84Lon",eElement)); } } } catch
	 * (Exception e) { e.printStackTrace(); }
	 */

		
        
        
        /*<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
        <response>
        	<header>
        		<resultCode>00</resultCode>
        		<resultMsg>NORMAL SERVICE.</resultMsg>
        	</header>
        	<body>
        		<items>
        			<item>
        				<dutyAddr>대전광역시 동구 계족로 362, 성남약국 1층 (성남동)</dutyAddr>
        				<dutyName>성남약국</dutyName>
        				<dutyTel1>042-672-2957</dutyTel1>
        				<dutyTime1c>1900</dutyTime1c>
        				<dutyTime1s>0900</dutyTime1s>
        				<dutyTime2c>1900</dutyTime2c>
        				<dutyTime2s>0900</dutyTime2s>
        				<dutyTime3c>1900</dutyTime3c>
        				<dutyTime3s>0900</dutyTime3s>
        				<dutyTime4c>1900</dutyTime4c>
        				<dutyTime4s>0900</dutyTime4s>
        				<dutyTime5c>1900</dutyTime5c>
        				<dutyTime5s>0900</dutyTime5s>
        				<dutyTime6c>1300</dutyTime6c>
        				<dutyTime6s>0900</dutyTime6s>
        				<hpid>C1601311</hpid>
        				<postCdn1>345</postCdn1>
        				<postCdn2>90 </postCdn2>
        				<rnum>1</rnum>
        				<wgs84Lat>36.3444243564852</wgs84Lat>
        				<wgs84Lon>127.434066050389</wgs84Lon>
        			</item>
        		</items>
	        	<numOfRows>3</numOfRows>
	        	<pageNo>1</pageNo>
	        	<totalCount>23413</totalCount>
        	</body>
        </response>
        */
        
        
//	}

//	private String getTagValue(String tag, Element eElement) {
//		// TODO Auto-generated method stub
//		NodeList nlList = eElement.getElementsByTagName(tag).item(0).getChildNodes();
//		Node nValue = (Node) nlList.item(0);
//		if(nValue == null) return null;
//		return nValue.getNodeValue();
//	}
	

	
	
	
	
}
