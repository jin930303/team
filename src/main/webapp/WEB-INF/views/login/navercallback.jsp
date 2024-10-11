<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.net.URL" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="org.json.JSONObject" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Naver Callback</title>
</head>
<body>
    <%
        String clientId = "PtxqAuJgt0ECukbGfDgR"; // 애플리케이션 클라이언트 아이디값
        String clientSecret = "v1p2zPAItY"; // 애플리케이션 클라이언트 시크릿값
        String code = request.getParameter("code");
        String state = request.getParameter("state");
        String redirectURI = URLEncoder.encode("http://localhost:8091/team", "UTF-8");
        
        // Access Token 요청
        String apiURL = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code"
                + "&client_id=" + clientId
                + "&client_secret=" + clientSecret
                + "&redirect_uri=" + redirectURI
                + "&code=" + code
                + "&state=" + state;
        
        String accessToken = "";
        try {
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            int responseCode = con.getResponseCode();
            BufferedReader br;

            if (responseCode == 200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else { // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }

            String inputLine;
            StringBuilder res = new StringBuilder();
            while ((inputLine = br.readLine()) != null) {
                res.append(inputLine);
            }
            br.close();

            // Access Token 사용하여 사용자 정보 요청
            JSONObject jsonResponse = new JSONObject(res.toString());
            accessToken = jsonResponse.getString("access_token"); // Access Token 저장
            
            // 사용자 정보 요청
            String userApiURL = "https://openapi.naver.com/v1/nid/me";
            URL userUrl = new URL(userApiURL);
            HttpURLConnection userCon = (HttpURLConnection) userUrl.openConnection();
            userCon.setRequestMethod("GET");
            userCon.setRequestProperty("Authorization", "Bearer " + accessToken); // Authorization 헤더 설정

            int userResponseCode = userCon.getResponseCode();
            BufferedReader userBr;

            if (userResponseCode == 200) { // 정상 호출
                userBr = new BufferedReader(new InputStreamReader(userCon.getInputStream()));
            } else { // 에러 발생
                userBr = new BufferedReader(new InputStreamReader(userCon.getErrorStream()));
            }

            StringBuilder userRes = new StringBuilder();
            while ((inputLine = userBr.readLine()) != null) {
                userRes.append(inputLine);
            }
            userBr.close();

            // 사용자 정보 처리
            JSONObject userJsonResponse = new JSONObject(userRes.toString());
            JSONObject userResponse = userJsonResponse.getJSONObject("response");
            String nickname = userResponse.getString("name");
            String email = userResponse.getString("email");
            String userId = userResponse.getString("id");

            // 세션에 사용자 정보 저장
            session.setAttribute("nickname", nickname);
            session.setAttribute("email", email);
            session.setAttribute("userId", userId);
            session.setAttribute("loginstate", true);
            System.out.println("세션 loginstate: " + session.getAttribute("loginstate"));
            System.out.println("세션 nickname: " + session.getAttribute("nickname"));
            System.out.println("세션 email: " + session.getAttribute("email"));
            
            System.out.println("Login state set to true: " + session.getAttribute("loginstate"));

            // 리디렉션
            System.out.println("Redirecting to /main");
            RequestDispatcher dispatcher = request.getRequestDispatcher("/main");
            dispatcher.forward(request, response);
            System.out.println("Login state before redirect: " + session.getAttribute("loginstate"));
            return;// 로그인 후 리디렉션할 페이지
            
        } catch (Exception e) {
            e.printStackTrace(); // 에러 로그 출력
            out.println("<script>alert('로그인 처리 중 오류가 발생했습니다. 다시 시도해주세요.');</script>");
            response.sendRedirect("/login"); // 에러 시 로그인 페이지로 리디렉트
        }
    %>
</body>
</html>
