using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
namespace LinqPractice
{
    class Program : Employee
    {

        static void Main(string[] args)
        {
            
            Employee employee = new Employee();
            IEnumerable<Employee> allEmployee = Employee.AllEmployees();

            foreach (var emp in allEmployee)
            {
                Console.WriteLine("EmployeeId :{0} FirstName :{1} ,LastName :{2} , Salary :{3} , JoiningDate :{4} , Department :{5}", emp.EmployeeId, emp.FirstName, emp.LastName, emp.Salary, emp.JoiningDate, emp.Department);
                Console.WriteLine("------------------------------------------------------------------------------------------------");
            }
            foreach (var emp1 in allEmployee)
            {
                Console.WriteLine("FirstName : {0} , LastName : {1}", emp1.FirstName, emp1.LastName);
                Console.WriteLine("------------------------------------------------------------------------------------------------");
            }

            Employee.AllEmployees();


        }
    }
}

