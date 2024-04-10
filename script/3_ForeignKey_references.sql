#Constraint Orders table
ALTER TABLE BikeStoreDB.Orders
ADD CONSTRAINT FK_Customer_ID FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID),
ADD CONSTRAINT FK_Store_ID FOREIGN KEY (Store_ID) REFERENCES BikeStoreDB.Stores(Store_ID),
ADD CONSTRAINT FK_Staff_ID FOREIGN KEY (Staff_ID) REFERENCES BikeStoreDB.Staffs(Staff_ID);

#Constraint Order_items table
ALTER TABLE BikeStoreDB.Order_items
ADD CONSTRAINT FK_Order_ID FOREIGN KEY (Order_ID) REFERENCES BikeStoreDB.Orders(Order_ID),
ADD CONSTRAINT FK_Product_ID FOREIGN KEY (Product_ID) REFERENCES BikeStoreDB.Products(Product_ID);

#Constraint Products table
ALTER TABLE BikeStoreDB.Products
ADD CONSTRAINT FK_Brand_ID FOREIGN KEY (Brand_ID) REFERENCES BikeStoreDB.Brands(Brand_ID),
ADD CONSTRAINT FK_Category_ID FOREIGN KEY (Category_ID) REFERENCES BikeStoreDB.Categories(Category_ID);

#Constraint Staffs table
ALTER TABLE BikeStoreDB.Staffs
ADD CONSTRAINT FK_Store_ID2 FOREIGN KEY (Store_ID) REFERENCES BikeStoreDB.Stores(Store_ID);

#Constraint Stocks table
ALTER TABLE BikeStoreDB.Stocks
ADD CONSTRAINT FK_Store_ID3 FOREIGN KEY (Store_ID) REFERENCES BikeStoreDB.Stores(Store_ID),
ADD CONSTRAINT FK_Product_ID2 FOREIGN KEY (Product_ID) REFERENCES BikeStoreDB.Products(Product_ID);