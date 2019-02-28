package zb.tool;
import java.io.IOException;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.conn.ssl.DefaultHostnameVerifier;
import org.apache.http.conn.util.PublicSuffixMatcher;
import org.apache.http.conn.util.PublicSuffixMatcherLoader;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
  
  
public class HttpClientUtil {  
    private RequestConfig requestConfig = RequestConfig.custom()  
            .setSocketTimeout(15000)  
            .setConnectTimeout(15000)  
            .setConnectionRequestTimeout(15000)  
            .build();  
      
    private static HttpClientUtil instance = null;  
    private HttpClientUtil(){}  
    public static HttpClientUtil getInstance(){  
        if (instance == null) {  
            instance = new HttpClientUtil();  
        }  
        return instance;  
    }  
      
    /** 
     * 鍙戦�� post璇锋眰 
     * @param httpUrl 鍦板潃 
     */  
    public String sendHttpPost(String httpUrl) {  
        HttpPost httpPost = new HttpPost(httpUrl);// 鍒涘缓httpPost    
        return sendHttpPost(httpPost,"utf-8");  
    }  
      
      
    /** 
     * 鍙戦�� post璇锋眰 
     * @param httpUrl 鍦板潃 
     * @param maps 鍙傛暟 
     *  @param type 瀛楃缂栫爜鏍煎紡 
     */  
    public String sendHttpPost(String httpUrl, Map<String, String> maps,String type) {  
        HttpPost httpPost = new HttpPost(httpUrl);// 鍒涘缓httpPost    
        // 鍒涘缓鍙傛暟闃熷垪    
        List<NameValuePair> nameValuePairs = new ArrayList<NameValuePair>();  
        for (String key : maps.keySet()) {  
            nameValuePairs.add(new BasicNameValuePair(key, maps.get(key)));  
        }  
        try {  
            httpPost.setEntity(new UrlEncodedFormEntity(nameValuePairs, type));  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return sendHttpPost(httpPost,type);  
    }  
      
    /** 
     * 鍙戦�丳ost璇锋眰 
     * @param httpPost 
     * @return 
     */  
    private String sendHttpPost(HttpPost httpPost,String reponseType) {  
        CloseableHttpClient httpClient = null;  
        CloseableHttpResponse response = null;  
        HttpEntity entity = null;  
        String responseContent = null;  
        try {  
            // 鍒涘缓榛樿鐨刪ttpClient瀹炰緥.  
            httpClient = HttpClients.createDefault();  
            httpPost.setConfig(requestConfig);  
            // 鎵ц璇锋眰  
            response = httpClient.execute(httpPost);  
            entity = response.getEntity();  
            responseContent = EntityUtils.toString(entity, reponseType);  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                // 鍏抽棴杩炴帴,閲婃斁璧勬簮  
                if (response != null) {  
                    response.close();  
                }  
                if (httpClient != null) {  
                    httpClient.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return responseContent;  
    }  
  
    /** 
     * 鍙戦�� get璇锋眰 
     * @param httpUrl 
     */  
    public String sendHttpGet(String httpUrl) {  
        HttpGet httpGet = new HttpGet(httpUrl);// 鍒涘缓get璇锋眰  
        return sendHttpGet(httpGet);  
    }  
      
    /** 
     * 鍙戦�� get璇锋眰Https 
     * @param httpUrl 
     */  
    public String sendHttpsGet(String httpUrl) {  
        HttpGet httpGet = new HttpGet(httpUrl);// 鍒涘缓get璇锋眰  
        return sendHttpsGet(httpGet);  
    }  
    
    /**
     * @Title: sendMsgUtf8
     * @Description: TODO(鍙戦�乽tf8)
     * @param: @param Uid
     * @param: @param Key
     * @param: @param content
     * @param: @param mobiles
     * @param: @return      
     * @date: 2017-3-22 涓嬪崍5:58:07
     * @throws
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
    public int sendMsgUtf8(String Uid,String Key,String content,String mobiles){
    	Map maps = new HashMap();
		maps.put("Uid", Uid);
		maps.put("Key", Key);
		maps.put("smsMob", mobiles);
		maps.put("smsText", content);
		String result = sendHttpPost("http://utf8.sms.webchinese.cn", maps, "utf-8");
		return Integer.parseInt(result);
    }
    
    /**
     * @Title: sendMsgUtf8
     * @Description: TODO(鍙戦�乽tf8)
     * @param: @param Uid
     * @param: @param Key
     * @param: @param content
     * @param: @param mobiles
     * @param: @return     
     * @return: int     
     * @author:  ly
     * @date: 2017-3-22 涓嬪崍5:58:07
     * @throws
     */
    @SuppressWarnings({ "rawtypes", "unchecked" })
	public int sendMsgGbk(String Uid,String Key,String content,String mobiles){
    	Map maps = new HashMap();
		maps.put("Uid", Uid);
		maps.put("Key", Key);
		maps.put("smsMob", mobiles);
		maps.put("smsText", content);
		String result = sendHttpPost("http://gbk.sms.webchinese.cn", maps, "gbk");
		return Integer.parseInt(result);
    }
      
    /** 
     * 鍙戦�丟et璇锋眰 
     * @param httpPost 
     * @return 
     */  
    private String sendHttpGet(HttpGet httpGet) {  
        CloseableHttpClient httpClient = null;  
        CloseableHttpResponse response = null;  
        HttpEntity entity = null;  
        String responseContent = null;  
        try {  
            // 鍒涘缓榛樿鐨刪ttpClient瀹炰緥.  
            httpClient = HttpClients.createDefault();  
            httpGet.setConfig(requestConfig);  
            // 鎵ц璇锋眰  
            response = httpClient.execute(httpGet);  
            entity = response.getEntity();  
            responseContent = EntityUtils.toString(entity, "UTF-8");  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                // 鍏抽棴杩炴帴,閲婃斁璧勬簮  
                if (response != null) {  
                    response.close();  
                }  
                if (httpClient != null) {  
                    httpClient.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return responseContent;  
    }  
      
    /** 
     * 鍙戦�丟et璇锋眰Https 
     * @param httpPost 
     * @return 
     */  
    private String sendHttpsGet(HttpGet httpGet) {  
        CloseableHttpClient httpClient = null;  
        CloseableHttpResponse response = null;  
        HttpEntity entity = null;  
        String responseContent = null;  
        try {  
            // 鍒涘缓榛樿鐨刪ttpClient瀹炰緥.  
            PublicSuffixMatcher publicSuffixMatcher = PublicSuffixMatcherLoader.load(new URL(httpGet.getURI().toString()));  
            DefaultHostnameVerifier hostnameVerifier = new DefaultHostnameVerifier(publicSuffixMatcher);  
            httpClient = HttpClients.custom().setSSLHostnameVerifier(hostnameVerifier).build();  
            httpGet.setConfig(requestConfig);  
            // 鎵ц璇锋眰  
            response = httpClient.execute(httpGet);  
            entity = response.getEntity();  
            responseContent = EntityUtils.toString(entity, "UTF-8");  
        } catch (Exception e) {  
            e.printStackTrace();  
        } finally {  
            try {  
                // 鍏抽棴杩炴帴,閲婃斁璧勬簮  
                if (response != null) {  
                    response.close();  
                }  
                if (httpClient != null) {  
                    httpClient.close();  
                }  
            } catch (IOException e) {  
                e.printStackTrace();  
            }  
        }  
        return responseContent;  
    }  
    
    /**
	 * @Title: getErrorMsg
	 * @Description: TODO(杩斿洖寮傚父鍘熷洜)
	 * @param: @param errorCode
	 */
	public String getErrorMsg(int errorCode){
		if(errorCode==-1){
			return "娌℃湁璇ョ敤鎴疯处鎴�";
		}else if(errorCode==-2){
			return "鎺ュ彛瀵嗛挜涓嶆纭�";
		}else if(errorCode==-3){
			return "鐭俊鏁伴噺涓嶈冻";
		}else if(errorCode==-4){
			return "鎵嬫満鍙锋牸寮忎笉姝ｇ‘";
		}else if(errorCode==-21){
			return "MD5鎺ュ彛瀵嗛挜鍔犲瘑涓嶆纭�";
		}else if(errorCode==-11){
			return "璇ョ敤鎴疯绂佺敤";
		}else if(errorCode==-14){
			return "鐭俊鍐呭鍑虹幇闈炴硶瀛楃";
		}else if(errorCode==-41){
			return "鎵嬫満鍙风爜涓虹┖";
		}else if(errorCode==-42){
			return "鐭俊鍐呭涓虹┖";
		}else if(errorCode==-51){
			return "鐭俊绛惧悕鏍煎紡涓嶆纭�";
		}else if(errorCode==-6){
			return "IP闄愬埗";
		}else{
			return "鏈煡閿欒鐮�:"+errorCode;
		}
	}
}  