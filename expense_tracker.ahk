; expense_tracker.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Define the expenses to be tracked
expenses := Object()

; Function to add a new expense
AddExpense(expenseName, expenseAmount, expenseCategory) {
    global expenses
    expenses[expenseName] := {Amount: expenseAmount, Category: expenseCategory}
}

; Function to remove an expense
RemoveExpense(expenseName) {
    global expenses
    expenses.Delete(expenseName)
}

; Function to get total expenses
GetTotalExpenses() {
    global expenses
    total := 0
    for expenseName, expense in expenses {
        total += expense.Amount
    }
    return total
}

; Function to get expenses by category
GetExpensesByCategory(category) {
    global expenses
    categoryExpenses := 0
    for expenseName, expense in expenses {
        if (expense.Category == category) {
            categoryExpenses += expense.Amount
        }
    }
    return categoryExpenses
}

; Function to list all expenses
ListExpenses() {
    global expenses
    for expenseName, expense in expenses {
        MsgBox, % "Expense: " expenseName "`nAmount: " expense.Amount "`nCategory: " expense.Category
    }
}
