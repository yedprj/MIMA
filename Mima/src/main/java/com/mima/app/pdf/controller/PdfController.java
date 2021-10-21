package com.mima.app.pdf.controller;

import java.io.IOException;
import java.io.InputStream;
import java.net.URLEncoder;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mima.app.session.domain.BookingVO;
import com.mima.app.session.service.BookingService;

import lombok.extern.java.Log;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

@Log
@Controller
public class PdfController {

	@Autowired DataSource dataSource;
	@Autowired BookingService bookingService;
	
	
	@RequestMapping("/prePdf2")
	public String prePdf2(HttpServletResponse response, Model model, @RequestParam(required = false, defaultValue ="39" ) Integer bookingNo ) throws Exception{
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_booking_no", bookingNo);
		model.addAttribute("fileName", "/report/mima_all_prescription.jrxml");
		model.addAttribute("param", map);
		return "pdfView";
	}
	
	@RequestMapping("/prePdf3")
	public void prePdf3(HttpServletRequest request, HttpServletResponse response, 
			@RequestParam(required = false, defaultValue ="39" ) Integer bookingNo) throws Exception {
		log.info("************넘기는 파라미터 값"+bookingNo);
		Connection conn = dataSource.getConnection();
		InputStream jasperStream = getClass().getResourceAsStream("/report/mima_all_prescription.jasper");
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream); //파라미터 맵
		
		// 환자이름 찾기
		BookingVO bvo = new BookingVO();
		bvo = bookingService.findNamePtDoc(bookingNo);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p_booking_no", bookingNo);
		log.info("************이름***********"+ bvo.getName() );
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, map, conn);
		response.setContentType( "application/pdf" );
		response.setHeader("Content-disposition", "attachment; filename=" + URLEncoder.encode(bvo.getName() +"_처방전", "UTF-8") + ".pdf" ); // 다운 
		JasperExportManager.exportReportToPdfStream(jasperPrint, response.getOutputStream());
	
	}
	
	
	
	//엑셀출력
	@RequestMapping("/deptExcelView.do")
	public ModelAndView excelView(HttpServletResponse response) throws IOException{
	List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();// deptService.getDeptListMap(vo);
	HashMap<String, Object> data = new HashMap<String, Object>();
	data.put("departmentId", 10);
	data.put("departmentName", "인사");
	list.add(data);
	
	data = new HashMap<String, Object>();
	data.put("departmentId", 20);
	data.put("departmentName", "총무");
	list.add(data);
	
	HashMap<String, Object> map = new HashMap<String, Object>(); 
	// String[] header = {"departmentId","departmentName","managerId"};
	// map.put("headers", header);
	map.put("filename", "excel_dept");
	map.put("datas", list);
	return new ModelAndView("commonExcelView", map);
	}
	
	
}
