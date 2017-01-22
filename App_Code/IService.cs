using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;
using System.ServiceModel.Web;


[ServiceContract]
public interface IService
{
    [OperationContract]
    [WebInvoke(UriTemplate = "/Authenticate", Method = "POST",
        RequestFormat = WebMessageFormat.Json,
        ResponseFormat = WebMessageFormat.Json)]
    bool Authenticate(WCFUser user);

    [OperationContract]
    [WebGet(UriTemplate = "/DiscrepancyList/{selected}", ResponseFormat = WebMessageFormat.Json)]
    List<ItemDiscrepancyModel> GetDiscrepancyList(string selected);

    [OperationContract]
    [WebGet(UriTemplate = "/ItemList", ResponseFormat = WebMessageFormat.Json)]
    List<ItemModel> GetItemList();

    [OperationContract]
    [WebGet(UriTemplate = "/SerachItemList/{search}", ResponseFormat = WebMessageFormat.Json)]
    List<ItemModel> SerachItemList(string search);

    [OperationContract]
    [WebGet(UriTemplate = "/GetMaxPrice/{id}", ResponseFormat = WebMessageFormat.Json)]
    decimal GetMaxPrice(string id);

    [OperationContract]
    [WebGet(UriTemplate = "/GetMaxDiscrepancyId", ResponseFormat = WebMessageFormat.Json)]
    string GetMaxDiscrepancyId();

    [OperationContract]
    [WebInvoke(UriTemplate = "/SaveDiscrepancy", Method = "POST",
    RequestFormat = WebMessageFormat.Json,
    ResponseFormat = WebMessageFormat.Json)]
    void saveDiscrepancy(Discrepancy dis);

    [OperationContract]
    [WebGet(UriTemplate = "/GetDiscrepancy/{id}", ResponseFormat = WebMessageFormat.Json)]
    ItemDiscrepancyModel GetDiscrepancy(string id);

    [OperationContract]
    [WebGet(UriTemplate = "/UpdateDiscrepancy/{id}/{status}", ResponseFormat = WebMessageFormat.Json)]
    void UpdateDiscrepancy(string id,string status);

    [OperationContract]
    [WebGet(UriTemplate = "/ViewSubmission/{userId}", ResponseFormat = WebMessageFormat.Json)]
    List<RqHistory> ViewSubmission(string userId);

    [OperationContract]
    [WebGet(UriTemplate = "/ViewSubmission/{userId}/{status}", ResponseFormat = WebMessageFormat.Json)]
    List<RqHistory> SearchSubmission(string userId,string status);

    [OperationContract]
    [WebGet(UriTemplate = "/RequestDetail?id={id}", ResponseFormat = WebMessageFormat.Json)]
    List<RqDetail> ViewRequestDetail(string id);

    [OperationContract]
    [WebGet(UriTemplate = "/ApproveRequest?id={id}&comment={comment}&status={status}", ResponseFormat = WebMessageFormat.Json)]
    void ApproveRequest(string id,string comment,string status);


}
[DataContract]
public class WCFUser
{
    string username;
    string password;


    public WCFUser (string username, string password)
    {
        this.username = username;
        this.password = password;
    }

    [DataMember]
    public string Username
    {
        get { return username; }
        set { username = value; }
    }

    [DataMember]
    public string Password
    {
        get { return password; }
        set { password = value; }
    }

}

