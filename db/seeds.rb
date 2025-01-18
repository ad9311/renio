expense_categories = [
  { uid: "food", name: "Food" },
  { uid: "drink", name: "Drink" },
  { uid: "entertainment", name: "Entertainment" },
  { uid: "transport", name: "Transport" },
  { uid: "other", name: "Other" }
]
expense_categories.each do |params|
  ExpenseCategory.find_or_create_by!(params)
end
