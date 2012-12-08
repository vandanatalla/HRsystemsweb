using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Facebook.WebControls;
using System.Collections.ObjectModel;
using System.Configuration;
using System.Collections.Specialized;
using System.IO;
using System.Net;


public partial class _Default : System.Web.UI.Page
{
    string facebook_urlAuthorize_base = "https://graph.facebook.com/oauth/authorize";
    string facebook_urlGetToken_base = "https://graph.facebook.com/oauth/access_token";
    string facebook_AppID = "348026645289167";
    string facebook_AppSecret = "ce2c9d78a747bbe92f8edec2ca56186e";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request["code"] != null)
            {
                //After this page have redirected the users browser to Facebook asking to be authorized to write to the
                //users wall, Facebook will redirect back to this page and if authorized having a "code" key in the querystring

                //Since we have a code we got authorized and can now
                //1) get an access_token
                //2) use the access_token to write to the users Facebook wall
                string authorizationCode = Request["code"];
                string access_token = Facebook_GetAccessToken(authorizationCode);
                if (access_token == "")
                {
                    Response.Write("Could not get access_token");
                    return;
                }
                Facebook_WriteWall(access_token, (string)Session["Message"]);
            }
        }
 
        
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        string message = tbMessage.Text;

        //necessary to save the message in a session since under the authentication & authorization process we are going to loose ViewState
        Session["message"] = message;

        Facebook_AuthorizeApplication();
    }
    private void Facebook_AuthorizeApplication()
    {
        //In this function we ask the user to authorize our Facebook application using an authorization request url

        //the authorization request url need to be appended
        //1) Our AppID
        //2) The permission scope (here publish_stream)
        //3) A Url that Facebook can redirect the users browser to then Facebook is finish asking the user whether permission can be granted

        string scope = "publish_stream"; //see: http://developers.facebook.com/docs/authentication/permissions/ for extended permissions
        string urlAuthorize = facebook_urlAuthorize_base;
        urlAuthorize += "?client_id=" + facebook_AppID;
        urlAuthorize += "&redirect_uri=" + Facebook_GetRedirectUri();
        urlAuthorize += "&scope=" + scope;

        //redirect the users browser to Facebook to ask the user to authorize our Facebook application
        Response.Redirect(urlAuthorize, true); //this cannot be done using WebRequest since facebook may need to show dialogs in the users browser
    }
    private string Facebook_GetAccessToken(string pAuthorizationCode)
    {
        //In this function we use the authorization code from before to obtain an access_token.
        //The access_token can be used to request resources from a specific user within the authorized permission scope

        //The access_token request url need to be appended
        //1) Our AppID
        //2) Our AppSecret
        //3) The exact same redirect_uri that was used before then authorized
        //4) The authorization code we just got from Facebook

        string urlGetAccessToken = facebook_urlGetToken_base;
        urlGetAccessToken += "?client_id=" + facebook_AppID;
        urlGetAccessToken += "&client_secret=" + facebook_AppSecret;
        urlGetAccessToken += "&redirect_uri=" + Facebook_GetRedirectUri();
        urlGetAccessToken += "&code=" + pAuthorizationCode;

        string responseData = RequestResponse(urlGetAccessToken); //we write RequestResponse a little later
        if (responseData == "")
        {
            return "";
        }
        NameValueCollection qs = HttpUtility.ParseQueryString(responseData);
        string access_token = qs["access_token"] == null ? "" : qs["access_token"];

        return access_token;
        //(The access_token is valid only from within the site domain specified for our Facebook application)
    }
    private void Facebook_WriteWall(string pAccessToken, string pMessage)
    {
        //In this function we will write to the users Facebook wall by posting the message through the Facebook Graph API

        //The post url need to be appended :
        //1) A username (I don't understand why, however I guess "me" will translate to the user embedded in the access_token)
        //2) A data type (here feed)
        //3) The access_token

        string username = "me";
        string datatype = "feed";
        string urlWriteWall = "https://graph.facebook.com/" + username + "/" + datatype + "?access_token=" + pAccessToken;

        //the message to post as a key/value pair
        string entityMessage = "message=" + Session["message"];
        entityMessage += "&picture=http://webmodelling.com/_images/jewelpit.png";
        entityMessage += "&link=http://webmodelling.com";
        entityMessage += "&name=Rasmus";
        entityMessage += "&caption=Writing to Facebook wall";

        HttpPost(urlWriteWall, entityMessage); //we write HttpPost a little later
    }
    private string Facebook_GetRedirectUri()
    {
        string urlCurrentPage = Request.Url.AbsoluteUri.IndexOf('?') == -1 ? Request.Url.AbsoluteUri : Request.Url.AbsoluteUri.Substring(0, Request.Url.AbsoluteUri.IndexOf('?'));
        NameValueCollection nvc = new NameValueCollection();
        foreach (string key in Request.QueryString) { if (key != "code") { nvc.Add(key, Request.QueryString[key]); } }
        string qs = "";
        foreach (string key in nvc)
        {
            qs += qs == "" ? "?" : "&";
            qs += key + "=" + nvc[key];
        }
        string redirect_uri = urlCurrentPage + qs; //urlCallback have to be exactly the same each time it is used (that's why the code key is removed)

        return redirect_uri;
    }
    private string HttpPost(string pUrl, string pPostData)
    {
        HttpWebRequest webRequest = (HttpWebRequest)HttpWebRequest.Create(pUrl);
        webRequest.ContentType = "application/x-www-form-urlencoded";
        webRequest.Method = "POST";
        byte[] bytes = System.Text.Encoding.UTF8.GetBytes(pPostData);
        Stream requestWriter = webRequest.GetRequestStream(); //GetRequestStream
        requestWriter.Write(bytes, 0, bytes.Length);
        requestWriter.Close();

        Stream responseStream = null;
        StreamReader responseReader = null;
        string responseData = "";
        try
        {
            WebResponse webResponse = webRequest.GetResponse();
            responseStream = webResponse.GetResponseStream();
            responseReader = new StreamReader(responseStream);
            responseData = responseReader.ReadToEnd();
        }
        catch (Exception exc)
        {
            throw new Exception("could not post : " + exc.Message);
        }
        finally
        {
            if (responseStream != null)
            {
                responseStream.Close();
                responseReader.Close();
            }
        }

        return responseData;
    }
    private string RequestResponse(string pUrl)
    {
        HttpWebRequest webRequest = System.Net.WebRequest.Create(pUrl) as HttpWebRequest;
        webRequest.Method = "GET";
        webRequest.ServicePoint.Expect100Continue = false;
        //webRequest.UserAgent = ;
        webRequest.Timeout = 20000;

        Stream responseStream = null;
        StreamReader responseReader = null;
        string responseData = "";
        try
        {
            WebResponse webResponse = webRequest.GetResponse();
            responseStream = webResponse.GetResponseStream();
            responseReader = new StreamReader(responseStream);
            responseData = responseReader.ReadToEnd();
        }
        catch (Exception exc)
        {
            Response.Write("<br /><br />ERROR : " + exc.Message);
        }
        finally
        {
            if (responseStream != null)
            {
                responseStream.Close();
                responseReader.Close();
            }
        }

        return responseData;
    }
}
