expense_categories = [
  { uid: "banking", name: "Banking" },
  { uid: "clothing", name: "Clothing" },
  { uid: "entertainment", name: "Entertainment" },
  { uid: "extra", name: "Extra" },
  { uid: "foodDelivery", name: "Food Delivery" },
  { uid: "groceries", name: "Groceries" },
  { uid: "home", name: "Home" },
  { uid: "insurance", name: "Insurance" },
  { uid: "onlineShopping", name: "Online Shopping" },
  { uid: "other", name: "Other" },
  { uid: "restaurants", name: "Restaurants" },
  { uid: "savings", name: "Savings" },
  { uid: "subscriptions", name: "Subscriptions" },
  { uid: "transportation", name: "Transportation" },
  { uid: "utilities", name: "Utilities" },
  { uid: "wages", name: "Wages" }
]
expense_categories.each do |params|
  ExpenseCategory.find_or_create_by!(params)
end
