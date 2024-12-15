package com.mbc.team.login;



import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mbc.team.member.MemberService;



@Controller
public class LoginController {
	
	
	@Autowired
	SqlSession sqlSession;
	HttpSession hs;
	MemberService ms;
	LoginService ls;
	
	@RequestMapping(value = "/login")
	public String login()
	{	
		
		return "login";
	}
	
	
	@RequestMapping(value = "/logout")
	public String login0(HttpServletRequest request)
	{
		hs=request.getSession();
		hs.setAttribute("loginstate", false);
		hs.setAttribute("adminloginstate", false);
		hs.removeAttribute("dto3");
		return "redirect:/main";
	}
	
	
	@RequestMapping(value = "/logincheck")
	public String login1(@RequestParam("id") String id,@RequestParam("pw") String inputpw,
			Model mo,HttpServletResponse response,HttpServletRequest request) throws IOException
	{
		/*
		 * String id=request.getParameter("id"); String
		 * inputpw=request.getParameter("pw");
		 */
		ls=sqlSession.getMapper(LoginService.class);
		LoginDTO dto3=ls.logincheck(id);
		response.setContentType("text/html;charset=utf-8");
		PrintWriter pww=response.getWriter();
		
		 if (dto3 != null) {
		        PasswordEncoder pe = new BCryptPasswordEncoder();
		        if (pe.matches(inputpw, dto3.getPw())) {
		            hs = request.getSession();
		            
		            if ("001".equals(dto3.getAuth())) {
		                hs.setAttribute("adminloginstate", true);
		                pww.print("<script> alert('�����ڴ� �ݰ����ϴ�!');</script>");
		                pww.print("<script> location.href='main';</script>");
		                pww.flush();
		                return "redirect:/main";
		            }
		            else {
		                hs.setAttribute("loginstate", true);
		                hs.setAttribute("dto3", dto3);
		                pww.print("<script> alert('�α��ο� �����Ͽ����ϴ�...!');</script>");
		                pww.print("<script> location.href='main';</script>");
		                pww.flush();
		                return "redirect:/main";
		            }
		        } else {
		            pww.print("<script> alert('��й�ȣ�� Ȯ�����ּ���'); history.go(-1);</script>");
		            pww.flush();
		            return null;
		        }
		    } else {
		        pww.print("<script> alert('�������� �ʴ� ������Դϴ�.'); history.go(-1);</script>");
		        pww.flush();
		        return null;
		    }
	}
	
	@RequestMapping(value = "/myinfo")
	public String myInfo(HttpServletRequest request, Model model, HttpServletResponse response) throws IOException {
	    hs = request.getSession();
	    
	    boolean loginState = Boolean.TRUE.equals(hs.getAttribute("loginstate"));

	    if (loginState) {
	        LoginDTO dto3 = (LoginDTO) hs.getAttribute("dto3");
	        LoginService ls = sqlSession.getMapper(LoginService.class);
	        LoginDTO dto1 = ls.myinfo(dto3.getId());
	        model.addAttribute("dto1", dto1);
	        return "myinfo";
	        
	    } else {
	        // �α��� ���°� false�� ��� ��� �޽��� ���
	        sendAlertAndRedirect(response, "�α��� �� �̿����ּ���.", "/team/login");
	        return null;
	    }
	}
	 private void sendAlertAndRedirect(HttpServletResponse response, String message, String redirectUrl) throws IOException {
	        response.setContentType("text/html;charset=utf-8");
	        PrintWriter pww = response.getWriter();
	        pww.print("<script> alert('" + message + "');</script>");
	        pww.print("<script> location.href='" + redirectUrl + "';</script>");
	        pww.flush();
	    }
	
	@RequestMapping(value = "/update")
	public String login3(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		ls=sqlSession.getMapper(LoginService.class);
		LoginDTO updateview=ls.updateview(id);
		mo.addAttribute("updateview",updateview);
		
		return "updateview";
	}
	
	@ResponseBody
	@RequestMapping(value = "/nicknamecheck2")
	public String login5(HttpServletRequest request)
	{
		String nickname=request.getParameter("nickname");
		ms=sqlSession.getMapper(MemberService.class);
		int count=ms.nicknamecheck1(nickname);
		if(count==0)
		{
			return "ok";
		}
		else
		{
			return "no";
		}
	}
	
	@RequestMapping(value = "/memberupdate2")
	public String login6(HttpServletRequest request,@ModelAttribute LoginDTO loginDTO,
			@RequestParam("pw") String pw1,@RequestParam("phone0") String phone0,
			@RequestParam("phone1") String phone1,@RequestParam("phone2") String phone2,
			@RequestParam("fdomain") String fdomain,@RequestParam("bdomain") String bdomain,
			@RequestParam("mainaddress") String mainaddress,@RequestParam("detailaddress") String detailaddress,
			@RequestParam("extraaddress") String extraaddress)
	{
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		String pw=passwordEncoder.encode(pw1);
		String phone=phone0+"-"+phone1+"-"+phone2;
		String email=fdomain+"@"+bdomain;
		String address = mainaddress + detailaddress + extraaddress;
		loginDTO.setPw(pw);
		loginDTO.setPhone(phone);
		loginDTO.setEmail(email);
		loginDTO.setAddress(address);
		ls=sqlSession.getMapper(LoginService.class);
		ls.memberupdate2(loginDTO);
		
		return "redirect:main";
	}
	
	@RequestMapping(value = "/delete")
	public String login7(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		ls=sqlSession.getMapper(LoginService.class);
		LoginDTO deleteview=ls.deleteview(id);
		mo.addAttribute("deleteview",deleteview);
		
		return "deleteview";
	}
	
	@RequestMapping(value = "/delete2")
	public String login8(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		String pw=request.getParameter("pw");
		ls=sqlSession.getMapper(LoginService.class);
		boolean success=(boolean) ls.delete2(id);
		if(success) {
			mo.addAttribute("message","�׵��� �̿��� �ּż� �����մϴ�");
			return "thanksforusing";
		}
		else
		{
			mo.addAttribute("error","��й�ȣ�� ��ġ���� �ʽ��ϴ�");
			return "deleteview";
		}
		
	}
	
	@RequestMapping(value = "/findmyid")
	public String login10()
	{
		return "findmyid";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findidcheck", method = RequestMethod.POST)
	public Map<String, Object> findIdCheck(HttpServletRequest request) {
	    String name = request.getParameter("name");
	    String email = request.getParameter("email");

	    Map<String, String> params = new HashMap<>();
	    params.put("name", name);
	    params.put("email", email);

	    ls = sqlSession.getMapper(LoginService.class);
	    LoginDTO findid = ls.findid(params); 

	    // JSON ���� ó��
	    Map<String, Object> response = new HashMap<>();
	    if (findid != null) {
	        response.put("id", findid.getId());
	        response.put("message", "���̵� ã�ҽ��ϴ�.");
	    } else {
	        response.put("id", null);
	        response.put("message", "���̵� ã�� �� �����ϴ�.");
	    }

	    return response; 
	}
	
	@RequestMapping(value = "/findmypw")
	public String login12()
	{
		
		return "findmypw";
	}
	
	@RequestMapping(value = "/findpwcheck",method = RequestMethod.POST)
	public String login13(HttpServletRequest request,Model mo)
	{
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		ls=sqlSession.getMapper(LoginService.class);
		LoginDTO findpw=ls.findpw(id,name,email);
		mo.addAttribute("findpw",findpw);
		return "confirmpw";
	}
	
	@RequestMapping(value = "/updatepw",method = RequestMethod.POST)
	public String login14(HttpServletRequest request,Model mo)
	{	
		String id=request.getParameter("id");
		String pw1=request.getParameter("pw");
		PasswordEncoder passwordEncoder=new BCryptPasswordEncoder();
		String pw=passwordEncoder.encode(pw1);
		ls=sqlSession.getMapper(LoginService.class);
		ls.updatepw(id,pw);
		return "redirect:/login";
	}
	
    @RequestMapping(value = "/kakaoLoginCheck", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> kakaoLoginCheck(HttpServletRequest request, @RequestParam String kakaoname) {
        Map<String, Object> responseMap = new HashMap<>();
        try {
            hs= request.getSession();
            hs.setAttribute("loginstate", true);  // �α��� ���� ����
            hs.setAttribute("kakaoname", kakaoname); // īī�� �г��� ����
            responseMap.put("redirect", "main"); // ���� �� �����̷�Ʈ�� ������ URL ��ȯ
        } catch (Exception e) {
            e.printStackTrace();
            responseMap.put("error", "īī�� �α��� ó�� �� ������ �߻��߽��ϴ�: " + e.getMessage());
        }
        return responseMap;
    }
    
    private static final String CLIENT_ID = "#";
    private static final String CLIENT_SECRET = "#";
    private static final String REDIRECT_URI = "http://localhost:8091/team/main";
    
   
//    //���̹� �α��� ����
//    @RequestMapping("/naver")
//    public String naverCallback(@RequestParam String code, @RequestParam String state, HttpServletRequest request, Model model) {
//        String accessTokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=MzF9TufJxvuIYOshvE"
//                + "&client_id=" + CLIENT_ID
//                + "&client_secret=" + CLIENT_SECRET
//                + "&code=" + code
//                + "&state=" + state;
//
//        String accessToken = getAccessTokenFromNaver(accessTokenUrl);
//
//        if (accessToken != null) {
//            Map<String, Object> userInfo = getUserInfoFromNaver(accessToken);
//
//            HttpSession session = request.getSession();
//            session.setAttribute("loginstate", true);  // �α��� ���� ����
//            session.setAttribute("naverUser", userInfo); // ���̹� ����� ���� ����
//
//            model.addAttribute("userInfo", userInfo);
//            return "redirect:/main";  // �α��� ���� �� ���� �������� �����̷�Ʈ
//        } else {
//            model.addAttribute("error", "���̹� �α��� ó�� �� ������ �߻��߽��ϴ�.");
//            return "login";
//        }
//    }
//
//    // Access Token ��û �޼���
//    private String getAccessTokenFromNaver(String accessTokenUrl) {
//        // ���⼭ HttpClient�� ����Ͽ� ���̹� API�� ȣ���ϰ� Access Token�� �޾ƿ��� ������ �ۼ��մϴ�.
//        // �޾ƿ� Access Token�� ��ȯ�մϴ�.
//        return "access_token_value"; // ���� ��
//    }
//
//    // ����� ���� ��û �޼���
//    private Map<String, Object> getUserInfoFromNaver(String accessToken) {
//        // Access Token�� �̿��� ���̹� ����� ������ ��û�ϴ� ������ �ۼ��մϴ�.
//        // ����� ������ JSON���� �޾Ƽ� �Ľ��� ��, �ʿ��� �����͸� Map���� ��ȯ�մϴ�.
//        return new HashMap<>(); // ���� ��ȯ��
//    }
//    
//    @RequestMapping("/team")
//    public String naverLoginCallback(@RequestParam String code, @RequestParam String state, Model model,HttpServletRequest request) {
//
//        String clientId = "PtxqAuJgt0ECukbGfDgR"; // ���̹� ������ ���Ϳ��� �߱��� Client ID
//        String clientSecret = "v1p2zPAItY"; // ���̹� ������ ���Ϳ��� �߱��� Client Secret
//        String redirectUri = "http://localhost:8092/team/main"; // Redirect URI
//
//        // �׼��� ��ū ��û�� ���� URL
//        String tokenUrl = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
//                + "&client_id=" + clientId
//                + "&client_secret=" + clientSecret
//                + "&code=" + code
//                + "&state=" + state
//                + "&redirect_uri=" + redirectUri;
//
//        // RestTemplate ����Ͽ� �׼��� ��ū ��û
//        RestTemplate restTemplate = new RestTemplate();
//        HttpHeaders headers = new HttpHeaders();
//        headers.set("Content-Type", "application/x-www-form-urlencoded");
//
//        HttpEntity<String> entity = new HttpEntity<>(headers);
//        ResponseEntity<Map> response = restTemplate.exchange(tokenUrl, HttpMethod.POST, entity, Map.class);
//
//        // �׼��� ��ū ����
//        String accessToken = (String) response.getBody().get("access_token");
//
//        if (accessToken != null) {
//            // �׼��� ��ū�� ����� ����� ���� ��û
//            String userInfoUrl = "https://openapi.naver.com/v1/nid/me";
//            headers.set("Authorization", "Bearer " + accessToken);
//            HttpEntity<String> userInfoEntity = new HttpEntity<>(headers);
//            ResponseEntity<Map> userInfoResponse = restTemplate.exchange(userInfoUrl, HttpMethod.GET, userInfoEntity, Map.class);
//
//            // ����� ���� ó�� (���÷� �̸��� �����´�)
//            Map<String, Object> userInfo = userInfoResponse.getBody();
//            String userName = (String) ((Map) userInfo.get("response")).get("name");
//
//            // ���ǿ� ����� ���� ����
//            HttpSession session = request.getSession();
//            session.setAttribute("loginstate", true);
//            session.setAttribute("naverUser", userInfo);  // ����� ���� ����
//            session.setAttribute("userName", userName);  // �̸� ����
//
//            model.addAttribute("userName", userName);  // ȭ�鿡 ����� �̸��� �����ֱ� ����
//            return "redirect:/main"; // �α��� ���� �� ���� �������� �����̷�Ʈ
//        } else {
//            model.addAttribute("error", "���̹� �α��� ó�� �� ������ �߻��߽��ϴ�.");
//            return "login"; // ���� �߻� �� �α��� �������� ���ư�
//        }
//}
}

