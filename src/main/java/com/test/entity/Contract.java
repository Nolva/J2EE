package com.test.entity;


public class Contract {
    private Integer contractId;
    private String clientNo;
    private String employeeId;
    private String contractName;
    private String contractContent;
    private String contractStartTime;
    private String contractValidity;

    public Integer getContractId() {
        return contractId;
    }

    public void setContractId(Integer contractId) {
        this.contractId = contractId;
    }

    public String getClientNo() {
        return clientNo;
    }

    public void setClientNo(String clientNo) {
        this.clientNo = clientNo;
    }

    public String getEmployeeId() {
        return employeeId;
    }

    public void setEmployeeId(String employeeId) {
        this.employeeId = employeeId;
    }

    public String getContractName() {
        return contractName;
    }

    public void setContractName(String contractNamel) {
        this.contractName = contractNamel;
    }

    public String getContractContent() {
        return contractContent;
    }

    public void setContractContent(String contractContent) {
        this.contractContent = contractContent;
    }

    public String getContractStartTime() {
        return contractStartTime;
    }

    public void setContractStartTime(String contractStartTime) {
        this.contractStartTime = contractStartTime;
    }

    public String getContractValidity() {
        return contractValidity;
    }

    public void setContractValidity(String contractValidity) {
        this.contractValidity = contractValidity;
    }
}
