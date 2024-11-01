package com.mbc.team.login;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class NaverLoginService {
    // Access Token 요청 메서드
    public String getAccessTokenFromNaver(String accessTokenUrl) {
        try {
            // HttpClient 생성
            HttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(accessTokenUrl);

            // 요청 보내기
            org.apache.http.HttpResponse response = client.execute(httpPost);

            // 응답 처리
            HttpEntity entity = response.getEntity();
            String result = EntityUtils.toString(entity);

            // JSON 파싱
            JSONObject jsonResponse = new JSONObject(result);
            return jsonResponse.getString("access_token"); // 액세스 토큰 반환
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

    // 사용자 정보 요청 메서드
    public Map<String, Object> getUserInfoFromNaver(String accessToken) {
        // 네이버 API 호출하여 사용자 정보를 가져오는 로직 구현
        String apiUrl = "https://openapi.naver.com/v1/nid/me";
        try {
            HttpClient client = HttpClients.createDefault();
            HttpPost httpPost = new HttpPost(apiUrl);
            httpPost.setHeader("Authorization", "Bearer " + accessToken);  // 토큰 헤더에 포함

            org.apache.http.HttpResponse response = client.execute(httpPost);

            HttpEntity entity = response.getEntity();
            String result = EntityUtils.toString(entity);

            // JSON 파싱
            JSONObject jsonResponse = new JSONObject(result);

            // 사용자 정보에서 필요한 데이터를 추출하여 반환
            Map<String, Object> userInfo = new HashMap<>();
            JSONObject responseObj = jsonResponse.getJSONObject("response");
            userInfo.put("id", responseObj.getString("id"));
            userInfo.put("name", responseObj.getString("name"));
            userInfo.put("email", responseObj.getString("email"));

            return userInfo;

        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
}

