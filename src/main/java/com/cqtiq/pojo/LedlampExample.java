package com.cqtiq.pojo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class LedlampExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public LedlampExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andDevnumIsNull() {
            addCriterion("devnum is null");
            return (Criteria) this;
        }

        public Criteria andDevnumIsNotNull() {
            addCriterion("devnum is not null");
            return (Criteria) this;
        }

        public Criteria andDevnumEqualTo(String value) {
            addCriterion("devnum =", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumNotEqualTo(String value) {
            addCriterion("devnum <>", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumGreaterThan(String value) {
            addCriterion("devnum >", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumGreaterThanOrEqualTo(String value) {
            addCriterion("devnum >=", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumLessThan(String value) {
            addCriterion("devnum <", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumLessThanOrEqualTo(String value) {
            addCriterion("devnum <=", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumLike(String value) {
            addCriterion("devnum like", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumNotLike(String value) {
            addCriterion("devnum not like", value, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumIn(List<String> values) {
            addCriterion("devnum in", values, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumNotIn(List<String> values) {
            addCriterion("devnum not in", values, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumBetween(String value1, String value2) {
            addCriterion("devnum between", value1, value2, "devnum");
            return (Criteria) this;
        }

        public Criteria andDevnumNotBetween(String value1, String value2) {
            addCriterion("devnum not between", value1, value2, "devnum");
            return (Criteria) this;
        }

        public Criteria andTimeIsNull() {
            addCriterion("time is null");
            return (Criteria) this;
        }

        public Criteria andTimeIsNotNull() {
            addCriterion("time is not null");
            return (Criteria) this;
        }

        public Criteria andTimeEqualTo(Date value) {
            addCriterion("time =", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotEqualTo(Date value) {
            addCriterion("time <>", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThan(Date value) {
            addCriterion("time >", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("time >=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThan(Date value) {
            addCriterion("time <", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeLessThanOrEqualTo(Date value) {
            addCriterion("time <=", value, "time");
            return (Criteria) this;
        }

        public Criteria andTimeIn(List<Date> values) {
            addCriterion("time in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotIn(List<Date> values) {
            addCriterion("time not in", values, "time");
            return (Criteria) this;
        }

        public Criteria andTimeBetween(Date value1, Date value2) {
            addCriterion("time between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andTimeNotBetween(Date value1, Date value2) {
            addCriterion("time not between", value1, value2, "time");
            return (Criteria) this;
        }

        public Criteria andPortIsNull() {
            addCriterion("port is null");
            return (Criteria) this;
        }

        public Criteria andPortIsNotNull() {
            addCriterion("port is not null");
            return (Criteria) this;
        }

        public Criteria andPortEqualTo(Integer value) {
            addCriterion("port =", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotEqualTo(Integer value) {
            addCriterion("port <>", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThan(Integer value) {
            addCriterion("port >", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortGreaterThanOrEqualTo(Integer value) {
            addCriterion("port >=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThan(Integer value) {
            addCriterion("port <", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortLessThanOrEqualTo(Integer value) {
            addCriterion("port <=", value, "port");
            return (Criteria) this;
        }

        public Criteria andPortIn(List<Integer> values) {
            addCriterion("port in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotIn(List<Integer> values) {
            addCriterion("port not in", values, "port");
            return (Criteria) this;
        }

        public Criteria andPortBetween(Integer value1, Integer value2) {
            addCriterion("port between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andPortNotBetween(Integer value1, Integer value2) {
            addCriterion("port not between", value1, value2, "port");
            return (Criteria) this;
        }

        public Criteria andDataIsNull() {
            addCriterion("data is null");
            return (Criteria) this;
        }

        public Criteria andDataIsNotNull() {
            addCriterion("data is not null");
            return (Criteria) this;
        }

        public Criteria andDataEqualTo(String value) {
            addCriterion("data =", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataNotEqualTo(String value) {
            addCriterion("data <>", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataGreaterThan(String value) {
            addCriterion("data >", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataGreaterThanOrEqualTo(String value) {
            addCriterion("data >=", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataLessThan(String value) {
            addCriterion("data <", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataLessThanOrEqualTo(String value) {
            addCriterion("data <=", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataLike(String value) {
            addCriterion("data like", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataNotLike(String value) {
            addCriterion("data not like", value, "data");
            return (Criteria) this;
        }

        public Criteria andDataIn(List<String> values) {
            addCriterion("data in", values, "data");
            return (Criteria) this;
        }

        public Criteria andDataNotIn(List<String> values) {
            addCriterion("data not in", values, "data");
            return (Criteria) this;
        }

        public Criteria andDataBetween(String value1, String value2) {
            addCriterion("data between", value1, value2, "data");
            return (Criteria) this;
        }

        public Criteria andDataNotBetween(String value1, String value2) {
            addCriterion("data not between", value1, value2, "data");
            return (Criteria) this;
        }

        public Criteria andGatewaycountIsNull() {
            addCriterion("gatewaycount is null");
            return (Criteria) this;
        }

        public Criteria andGatewaycountIsNotNull() {
            addCriterion("gatewaycount is not null");
            return (Criteria) this;
        }

        public Criteria andGatewaycountEqualTo(Integer value) {
            addCriterion("gatewaycount =", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountNotEqualTo(Integer value) {
            addCriterion("gatewaycount <>", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountGreaterThan(Integer value) {
            addCriterion("gatewaycount >", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountGreaterThanOrEqualTo(Integer value) {
            addCriterion("gatewaycount >=", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountLessThan(Integer value) {
            addCriterion("gatewaycount <", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountLessThanOrEqualTo(Integer value) {
            addCriterion("gatewaycount <=", value, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountIn(List<Integer> values) {
            addCriterion("gatewaycount in", values, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountNotIn(List<Integer> values) {
            addCriterion("gatewaycount not in", values, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountBetween(Integer value1, Integer value2) {
            addCriterion("gatewaycount between", value1, value2, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewaycountNotBetween(Integer value1, Integer value2) {
            addCriterion("gatewaycount not between", value1, value2, "gatewaycount");
            return (Criteria) this;
        }

        public Criteria andGatewayidIsNull() {
            addCriterion("gatewayid is null");
            return (Criteria) this;
        }

        public Criteria andGatewayidIsNotNull() {
            addCriterion("gatewayid is not null");
            return (Criteria) this;
        }

        public Criteria andGatewayidEqualTo(String value) {
            addCriterion("gatewayid =", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidNotEqualTo(String value) {
            addCriterion("gatewayid <>", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidGreaterThan(String value) {
            addCriterion("gatewayid >", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidGreaterThanOrEqualTo(String value) {
            addCriterion("gatewayid >=", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidLessThan(String value) {
            addCriterion("gatewayid <", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidLessThanOrEqualTo(String value) {
            addCriterion("gatewayid <=", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidLike(String value) {
            addCriterion("gatewayid like", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidNotLike(String value) {
            addCriterion("gatewayid not like", value, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidIn(List<String> values) {
            addCriterion("gatewayid in", values, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidNotIn(List<String> values) {
            addCriterion("gatewayid not in", values, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidBetween(String value1, String value2) {
            addCriterion("gatewayid between", value1, value2, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andGatewayidNotBetween(String value1, String value2) {
            addCriterion("gatewayid not between", value1, value2, "gatewayid");
            return (Criteria) this;
        }

        public Criteria andLosecountIsNull() {
            addCriterion("losecount is null");
            return (Criteria) this;
        }

        public Criteria andLosecountIsNotNull() {
            addCriterion("losecount is not null");
            return (Criteria) this;
        }

        public Criteria andLosecountEqualTo(Integer value) {
            addCriterion("losecount =", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountNotEqualTo(Integer value) {
            addCriterion("losecount <>", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountGreaterThan(Integer value) {
            addCriterion("losecount >", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountGreaterThanOrEqualTo(Integer value) {
            addCriterion("losecount >=", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountLessThan(Integer value) {
            addCriterion("losecount <", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountLessThanOrEqualTo(Integer value) {
            addCriterion("losecount <=", value, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountIn(List<Integer> values) {
            addCriterion("losecount in", values, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountNotIn(List<Integer> values) {
            addCriterion("losecount not in", values, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountBetween(Integer value1, Integer value2) {
            addCriterion("losecount between", value1, value2, "losecount");
            return (Criteria) this;
        }

        public Criteria andLosecountNotBetween(Integer value1, Integer value2) {
            addCriterion("losecount not between", value1, value2, "losecount");
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