# 📊 Database Schema Explanation

## 🧾 Overview

This project uses an e-commerce dataset to analyze customer behavior, revenue trends, and product performance.

---

## 🟢 Tables

### Customers

* customer_id (Primary Key)
* customer_city
* customer_state

### Orders

* order_id (Primary Key)
* customer_id (Foreign Key)
* order_purchase_timestamp
* order_status

### Payments

* order_id (Foreign Key)
* payment_value

### Order_Items

* order_id (Foreign Key)
* product_id (Foreign Key)

### Products

* product_id (Primary Key)
* product_category

---

## 🔗 Relationships

* One customer → many orders
* One order → many payments
* One order → many products
* One product → many orders

---

## 📌 Summary

The schema helps track customer activity, orders, payments, and product sales for business analysis.

The schema helps track customer activity, orders, payments, and product sales for business analysis.

