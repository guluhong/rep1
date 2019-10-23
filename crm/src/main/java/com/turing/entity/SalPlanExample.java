package com.turing.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class SalPlanExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SalPlanExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
        }

        public Criteria andPlaIdIsNull() {
            addCriterion("pla_id is null");
            return (Criteria) this;
        }

        public Criteria andPlaIdIsNotNull() {
            addCriterion("pla_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlaIdEqualTo(Integer value) {
            addCriterion("pla_id =", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdNotEqualTo(Integer value) {
            addCriterion("pla_id <>", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdGreaterThan(Integer value) {
            addCriterion("pla_id >", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("pla_id >=", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdLessThan(Integer value) {
            addCriterion("pla_id <", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdLessThanOrEqualTo(Integer value) {
            addCriterion("pla_id <=", value, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdIn(List<Integer> values) {
            addCriterion("pla_id in", values, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdNotIn(List<Integer> values) {
            addCriterion("pla_id not in", values, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdBetween(Integer value1, Integer value2) {
            addCriterion("pla_id between", value1, value2, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("pla_id not between", value1, value2, "plaId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdIsNull() {
            addCriterion("pla_chc_id is null");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdIsNotNull() {
            addCriterion("pla_chc_id is not null");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdEqualTo(Integer value) {
            addCriterion("pla_chc_id =", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdNotEqualTo(Integer value) {
            addCriterion("pla_chc_id <>", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdGreaterThan(Integer value) {
            addCriterion("pla_chc_id >", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("pla_chc_id >=", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdLessThan(Integer value) {
            addCriterion("pla_chc_id <", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdLessThanOrEqualTo(Integer value) {
            addCriterion("pla_chc_id <=", value, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdIn(List<Integer> values) {
            addCriterion("pla_chc_id in", values, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdNotIn(List<Integer> values) {
            addCriterion("pla_chc_id not in", values, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdBetween(Integer value1, Integer value2) {
            addCriterion("pla_chc_id between", value1, value2, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaChcIdNotBetween(Integer value1, Integer value2) {
            addCriterion("pla_chc_id not between", value1, value2, "plaChcId");
            return (Criteria) this;
        }

        public Criteria andPlaDateIsNull() {
            addCriterion("pla_date is null");
            return (Criteria) this;
        }

        public Criteria andPlaDateIsNotNull() {
            addCriterion("pla_date is not null");
            return (Criteria) this;
        }

        public Criteria andPlaDateEqualTo(Date value) {
            addCriterionForJDBCDate("pla_date =", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("pla_date <>", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateGreaterThan(Date value) {
            addCriterionForJDBCDate("pla_date >", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("pla_date >=", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateLessThan(Date value) {
            addCriterionForJDBCDate("pla_date <", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("pla_date <=", value, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateIn(List<Date> values) {
            addCriterionForJDBCDate("pla_date in", values, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("pla_date not in", values, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("pla_date between", value1, value2, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("pla_date not between", value1, value2, "plaDate");
            return (Criteria) this;
        }

        public Criteria andPlaTodeIsNull() {
            addCriterion("pla_tode is null");
            return (Criteria) this;
        }

        public Criteria andPlaTodeIsNotNull() {
            addCriterion("pla_tode is not null");
            return (Criteria) this;
        }

        public Criteria andPlaTodeEqualTo(String value) {
            addCriterion("pla_tode =", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeNotEqualTo(String value) {
            addCriterion("pla_tode <>", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeGreaterThan(String value) {
            addCriterion("pla_tode >", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeGreaterThanOrEqualTo(String value) {
            addCriterion("pla_tode >=", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeLessThan(String value) {
            addCriterion("pla_tode <", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeLessThanOrEqualTo(String value) {
            addCriterion("pla_tode <=", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeLike(String value) {
            addCriterion("pla_tode like", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeNotLike(String value) {
            addCriterion("pla_tode not like", value, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeIn(List<String> values) {
            addCriterion("pla_tode in", values, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeNotIn(List<String> values) {
            addCriterion("pla_tode not in", values, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeBetween(String value1, String value2) {
            addCriterion("pla_tode between", value1, value2, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaTodeNotBetween(String value1, String value2) {
            addCriterion("pla_tode not between", value1, value2, "plaTode");
            return (Criteria) this;
        }

        public Criteria andPlaResuleIsNull() {
            addCriterion("pla_resule is null");
            return (Criteria) this;
        }

        public Criteria andPlaResuleIsNotNull() {
            addCriterion("pla_resule is not null");
            return (Criteria) this;
        }

        public Criteria andPlaResuleEqualTo(String value) {
            addCriterion("pla_resule =", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleNotEqualTo(String value) {
            addCriterion("pla_resule <>", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleGreaterThan(String value) {
            addCriterion("pla_resule >", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleGreaterThanOrEqualTo(String value) {
            addCriterion("pla_resule >=", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleLessThan(String value) {
            addCriterion("pla_resule <", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleLessThanOrEqualTo(String value) {
            addCriterion("pla_resule <=", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleLike(String value) {
            addCriterion("pla_resule like", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleNotLike(String value) {
            addCriterion("pla_resule not like", value, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleIn(List<String> values) {
            addCriterion("pla_resule in", values, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleNotIn(List<String> values) {
            addCriterion("pla_resule not in", values, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleBetween(String value1, String value2) {
            addCriterion("pla_resule between", value1, value2, "plaResule");
            return (Criteria) this;
        }

        public Criteria andPlaResuleNotBetween(String value1, String value2) {
            addCriterion("pla_resule not between", value1, value2, "plaResule");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}