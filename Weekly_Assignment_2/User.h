#ifndef INCLUDED_USER
#define INCLUDED_USER

#include "utils/Color_Codes.h"
#include "utils/Unique_Random_Number_Generator.h"

#include "accounts/Current_Account.h"
#include "accounts/Loan_Account.h"
#include "accounts/Saving_Account.h"

class User {
public:
  User(std::string Name, long long Phone_Number, std::string Email_Address,
       std::string Home_Address)
      : m_Name(Name), m_Phone_Number(Phone_Number),
        m_Email_Address(Email_Address), m_Home_Address(Home_Address) {

    m_Customer_ID = s_Customer_ID_Generator.Get();

    m_Saving_Accounts.clear();
    m_Current_Accounts.clear();
    m_Loan_Accounts.clear();
  }

public:
  std::string Get_Name() { return m_Name; }
  long long Get_Phone_Number() { return m_Phone_Number; }
  std::string Get_Email_Address() { return m_Email_Address; }
  std::string Get_Home_Address() { return m_Home_Address; }

public:
private:
  static const int sc_Digits_In_Customer_ID = 3;
  static const int sc_Number_Of_Users = 500'000;

private:
  static Unique_Random_Number_Generator s_Customer_ID_Generator;

private:
  std::string m_Name;
  int m_Age;
  long long m_Phone_Number;
  std::string m_Email_Address;
  std::string m_Home_Address;

  long long m_Customer_ID;

  std::unordered_set<long long> m_Saving_Accounts;
  std::unordered_set<long long> m_Current_Accounts;
  std::unordered_set<long long> m_Loan_Accounts;
};

Unique_Random_Number_Generator
    User::s_Customer_ID_Generator(User::sc_Digits_In_Customer_ID,
                                  User::sc_Number_Of_Users);

#endif
