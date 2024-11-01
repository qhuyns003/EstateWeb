package com.javaweb.repository.custom.impl;

import com.javaweb.entity.UserEntity;
import com.javaweb.repository.custom.UserRepositoryCustom;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.Collections;
import java.util.List;

@Repository
public class UserRepositoryImpl implements UserRepositoryCustom {
	@Override
	public List<UserEntity> findByCustomerId(Long customerId) {
		StringBuilder sql = new StringBuilder("");
		sql.append(" select user.* from user ");
		sql.append(" inner join assignmentcustomer  on assignmentcustomer.staffid = user.id ");
		sql.append(" inner join customer  on assignmentcustomer.customerid = customer.id ");
		sql.append(" WHERE customer.id = "+customerId);
		sql.append(" group by user.id ");
		Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
		return query.getResultList();
	}

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<UserEntity> findByRole(String roleCode) {
		//JPQL
		String sql = "FROM UserEntity";
		Query query = entityManager.createNativeQuery(sql, UserEntity.class);
		return query.getResultList();
	}

	@Override
	public List<UserEntity> getAllUsers(Pageable pageable) {

		StringBuilder sql = new StringBuilder(buildQueryFilter())
				.append(" LIMIT ").append(pageable.getPageSize()).append("\n")
				.append(" OFFSET ").append(pageable.getOffset());
		System.out.println("Final query: " + sql.toString());

		Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
		return query.getResultList();
	}

	@Override
	public int countTotalItem() {
		String sql = buildQueryFilter();
		Query query = entityManager.createNativeQuery(sql.toString());
		return query.getResultList().size();
	}

	@Override
	public List<UserEntity> findByBuildingId(Long buildingId) {
		StringBuilder sql = new StringBuilder("");
		sql.append(" select user.* from user ");
		sql.append(" inner join assignmentbuilding  on assignmentbuilding.staffid = user.id ");
		sql.append(" inner join building  on assignmentbuilding.buildingid = building.id ");
		sql.append(" WHERE building.id = "+buildingId);
		sql.append(" group by user.id ");
		Query query = entityManager.createNativeQuery(sql.toString(), UserEntity.class);
		return query.getResultList();
	}

	private String buildQueryFilter() {
		String sql = "SELECT * FROM user u WHERE u.status = 1";
		return sql;
	}
}
