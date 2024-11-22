package com.javaweb.entity;

import com.javaweb.model.dto.AbstractDTO;
import org.dom4j.tree.AbstractEntity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "customer")
public class CustomerEntity extends BaseEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name ="fullname")
    private String fullName;
    @Column(name ="phone")
    private String phone;
    @Column(name ="email")
    private String email;
    @Column(name ="companyname")
    private String companyName;
    @Column(name ="demand")
    private String demand;
    @Column(name ="status")
    private String status;
    @Column(name ="is_active")
    private Integer isActive;
//    @Column(name = "createddate")
//    private String createdDate;
//    @Column(name = "modifieddate")
//    private String modifiedDate;
//    @Column(name = "createdby")
//    private String createdBy;
//    @Column(name = "modifiedby")
//    private String modifiedBy;
    @ManyToMany(fetch = FetchType.LAZY)

    @JoinTable(name = "assignmentcustomer",
            joinColumns = @JoinColumn(name = "customerid", nullable = false),
            inverseJoinColumns = @JoinColumn(name = "staffid", nullable = false))
    private List<UserEntity> users = new ArrayList<>();

    @OneToMany(mappedBy = "customer", fetch = FetchType.LAZY, cascade = {CascadeType.ALL},orphanRemoval = true)
    private List<TransactionEntity> transactionEntities = new ArrayList<>();

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getDemand() {
        return demand;
    }

    public void setDemand(String demand) {
        this.demand = demand;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Integer getIsActive() {
        return isActive;
    }

    public void setIsActive(Integer isActive) {
        this.isActive = isActive;
    }

//    public String getCreatedDate() {
//        return createdDate;
//    }
//
//    public void setCreatedDate(String createdDate) {
//        this.createdDate = createdDate;
//    }
//
//    public String getModifiedDate() {
//        return modifiedDate;
//    }
//
//    public void setModifiedDate(String modifiedDate) {
//        this.modifiedDate = modifiedDate;
//    }
//
//    public String getCreatedBy() {
//        return createdBy;
//    }
//
//    public void setCreatedBy(String createdBy) {
//        this.createdBy = createdBy;
//    }
//
//    public String getModifiedBy() {
//        return modifiedBy;
//    }
//
//    public void setModifiedBy(String modifiedBy) {
//        this.modifiedBy = modifiedBy;
//    }

    public List<UserEntity> getUsers() {
        return users;
    }

    public void setUsers(List<UserEntity> users) {
        this.users = users;
    }
}
