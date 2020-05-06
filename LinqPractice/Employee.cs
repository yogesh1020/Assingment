using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;

namespace LinqPractice
{

    public class Incentives
    {
        public int EmployeeId { get; set; }
        public DateTime IncentiveDate { get; set; }
        public int IncentivesAmount { get; set; }

        public static List<Incentives> AllIncentives()
        {
            List<Incentives> incentivesList = new List<Incentives>();

            Incentives incentives1 = new Incentives()
            {
                EmployeeId = 1,
                IncentiveDate = new DateTime(2013, 02, 01),
                IncentivesAmount = 5000
            };
            incentivesList.Add(incentives1);

            Incentives incentives2 = new Incentives()
            {
                EmployeeId = 2,
                IncentiveDate = new DateTime(2013, 02, 01),
                IncentivesAmount = 3000
            };
            incentivesList.Add(incentives2);

            Incentives incentives3 = new Incentives()
            {
                EmployeeId = 3,
                IncentiveDate = new DateTime(2013, 02, 01),
                IncentivesAmount = 4000
            };
            incentivesList.Add(incentives3);

            Incentives incentives4 = new Incentives()
            {
                EmployeeId = 1,
                IncentiveDate = new DateTime(2013, 01, 01),
                IncentivesAmount = 4500
            };
            incentivesList.Add(incentives4);

            Incentives incentives5 = new Incentives()
            {
                EmployeeId = 2,
                IncentiveDate = new DateTime(2013, 02, 01),
                IncentivesAmount = 3500
            };
            incentivesList.Add(incentives5);

            return incentivesList;
        }


    }

    public class Employee
    {
        public int EmployeeId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public int Salary { get; set; }
        public DateTime JoiningDate { get; set; }
        public string Department { get; set; }


       
 

        public static List<Employee> AllEmployees()
        {
            List<Incentives> incentivesList = new List<Incentives>();

            List<Employee> employeeList = new List<Employee>();

            Employee employee1 = new Employee()
            {
                EmployeeId = 1,
                FirstName = "John",
                LastName = "Abraham",
                Salary = 1000000,
                JoiningDate = new DateTime(2013, 01, 01),
                Department = "Banking",
            };
            employeeList.Add(employee1);

            Employee employee2 = new Employee()
            {
                EmployeeId = 2,
                FirstName = "Michael  ",
                LastName = "Clark",
                Salary = 800000,
                JoiningDate = new DateTime(2013, 01, 01),
                Department = "Insurance",
            };
            employeeList.Add(employee2);

            Employee employee3 = new Employee()
            {
                EmployeeId = 3,
                FirstName = "Roy",
                LastName = "Thomas",
                Salary = 700000,
                JoiningDate = new DateTime(2013, 02, 01),
                Department = "Banking",
            };
            employeeList.Add(employee3);

            Employee employee4 = new Employee()
            {
                EmployeeId = 4,
                FirstName = "Tom",
                LastName = "Jose",
                Salary = 600000,
                JoiningDate = new DateTime(2013, 02, 01),
                Department = "Insurance",
            };
            employeeList.Add(employee4);

            Employee employee5 = new Employee()
            {
                EmployeeId = 5,
                FirstName = "Jerry  ",
                LastName = "Pinto",
                Salary = 650000,
                JoiningDate = new DateTime(2013, 02, 01),
                Department = "Insurance",
            };
            employeeList.Add(employee5);

            Employee employee6 = new Employee()
            {
                EmployeeId = 6,
                FirstName = "Philip",
                LastName = "Methew",
                Salary = 750000,
                JoiningDate = new DateTime(2013, 01, 01),
                Department = "Service",
            };
            employeeList.Add(employee6);

            Employee employee7 = new Employee()
            {
                EmployeeId = 7,
                FirstName = "TestName2  ",
                LastName = "Lname%",
                Salary = 600000,
                JoiningDate = new DateTime(2013, 01, 01),
                Department = "Insurance",
            };
            employeeList.Add(employee7);


            var results = employeeList.Select(a =>new Employee {FirstName = a.FirstName , LastName = a.LastName }).ToList();
            Console.WriteLine(results);      
            foreach(var res in results)
            {
                Console.WriteLine("FirstName : {0} , Last Name : {1}" ,res.FirstName,res.LastName);
                Console.WriteLine("------------------------------------------------------------------------------------------------");
            }
            var uper = employeeList.Select(a => a.FirstName.ToUpper()).ToList();

            foreach (var up in uper)
            {
                Console.WriteLine("First Name in Upper :{0}", up);
                Console.WriteLine("------------------------------------------------------------------------------------------------");
            }

            var lower = employeeList.Select(a => a.FirstName.ToLower()).ToList();

            foreach (var low in lower)
            {
                Console.WriteLine("First Name in Lower :{0}", low);
               
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");
            var unique = employeeList.Select(a => a.Department).Distinct().ToList();
            Console.WriteLine(unique);
            foreach (var un in unique)
            {
                Console.WriteLine("Department Name :{0}", un);
               
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");
            var three = employeeList.Select(a => a.FirstName).ToList();
            foreach (var tr in three)
            {
                string name = tr.Substring(0, 3);
                int index = tr.IndexOf("o");
                string right = tr.TrimStart();
                string left = tr.TrimEnd();

                Console.WriteLine("Three Later of First Name :{0}", name);
                
                Console.WriteLine("index of o : {0}", index);
              
                Console.WriteLine("remove right whitespace :{0}", right);
                Console.WriteLine("remove left whitespace :{0}", left);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            foreach(var len in three)
            {

                int length = len.Trim().Length;
                Console.WriteLine("Length of First Name :{0}", length);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");
           foreach(var rp in three)
            {
                int str = rp.IndexOf("o");
                if (str != null)
                {
                   string newrep = rp.Replace("o", "$");
                    Console.WriteLine("Replace woth $ :{0}", newrep);
                }
                else
                {
                    Console.WriteLine("O is not Found In Name");
                }
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");
            foreach(var sep in results)
            {
                string fName = sep.FirstName;
                string lName = sep.LastName;
                string fullName = String.Concat(fName, "_", lName);
                Console.WriteLine(fullName);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            var date = employeeList.Select(a=>new Employee {FirstName = a.FirstName, JoiningDate = a.JoiningDate});
            foreach(var d in date)
            {
                int yyyy = d.JoiningDate.Year;
                int mm = d.JoiningDate.Month;
                int dd = d.JoiningDate.Day;
                Console.WriteLine("FirstName :{0},Year:{1},Month:{2},Day :{3}", d.FirstName, yyyy, mm, dd);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            var ord = from s in employeeList orderby s.FirstName select s;
            foreach (var o in ord)
            {
           
                Console.WriteLine("FirstName :{0}",o.FirstName);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            var des = from d in employeeList orderby d.FirstName descending select d;
            foreach (var o in des)
            {

                Console.WriteLine("FirstName :{0}", o.FirstName);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            var detail = employeeList.OrderBy(a => a.FirstName).ThenByDescending(a => a.Salary);
            foreach (var res in detail)
            {
                Console.WriteLine("FirstName :{0}", res.FirstName);
                Console.WriteLine(" salary:{0} ",res.Salary);
            }
            Console.WriteLine("------------------------------------------------------------------------------------------------");

            var eDetail = from e in employeeList where e.FirstName=="John" select e;
            foreach (var res in eDetail)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}",res.FirstName,res.LastName,res.JoiningDate,res.Salary,res.Department);
            }
            Console.WriteLine("20----------------------------------------------------------------------------------------------");
          
            var twoDetail = from e in employeeList where e.FirstName == "John" && e.FirstName=="Roy" select e;
            foreach (var res in twoDetail)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("21----------------------------------------------------------------------------------------------");

            var notDetail = from e in employeeList where e.FirstName != "John" && e.FirstName!="Roy" select e;
            foreach (var res in notDetail)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("22----------------------------------------------------------------------------------------------");

            var like = from e in employeeList where e.FirstName.StartsWith("J") select e;
            foreach (var res in like)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("23----------------------------------------------------------------------------------------------");

            var contains = from e in employeeList where e.FirstName.Contains("o") select e;
            foreach (var res in contains)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("24----------------------------------------------------------------------------------------------");


            var endWiwth = from e in employeeList where e.FirstName.EndsWith("n") select e;
            foreach (var res in endWiwth)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("25----------------------------------------------------------------------------------------------");


            var fourLater = from e in employeeList where e.FirstName.EndsWith("n") && e.FirstName.Length ==4 select e;
            foreach (var res in fourLater)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("26----------------------------------------------------------------------------------------------");

            var startJ = from e in employeeList where e.FirstName.StartsWith("J") && e.FirstName.Length == 4 select e;
            foreach (var res in startJ)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("27----------------------------------------------------------------------------------------------");

            var salaryGreter = from e in employeeList where e.Salary >600000 select e;
            foreach (var res in salaryGreter)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("28----------------------------------------------------------------------------------------------");

            var salaryLess = from e in employeeList where e.Salary < 800000 select e;
            foreach (var res in salaryLess)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("29----------------------------------------------------------------------------------------------");

            var salaryBtvn = from e in employeeList where e.Salary > 500000 && e.Salary < 800000 select e;
            foreach (var res in salaryBtvn)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("30----------------------------------------------------------------------------------------------");


            var twoName = from e in employeeList where e.FirstName =="John" && e.FirstName == "Michael"  select e;
            foreach (var res in twoName)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("31----------------------------------------------------------------------------------------------");

            var year = from e in employeeList where e.JoiningDate.Year == 2013 select e;
            foreach (var res in year)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("32----------------------------------------------------------------------------------------------");

            var month = from e in employeeList where e.JoiningDate.Month == 01 select e;
            foreach (var res in month)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("33----------------------------------------------------------------------------------------------");

            var joinBefor = from e in employeeList where e.JoiningDate < new DateTime(2013,01,01) select e;
            foreach (var res in joinBefor)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("34----------------------------------------------------------------------------------------------");

            var joinAfter = from e in employeeList where e.JoiningDate > new DateTime(2013,01,01) select e;
            foreach (var res in joinAfter)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("35----------------------------------------------------------------------------------------------");

            /*            var year = from e in employeeList where e.JoiningDate.Year == 2013 select e;
                        foreach (var res in year)
                        {
                            Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
                        }
                        Console.WriteLine("37----------------------------------------------------------------------------------------------");
            */
            var diff = from e1 in employeeList join e2 in incentivesList on e1.EmployeeId equals e2.EmployeeId select new {
               
            
            };
            foreach (var res in year)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("39----------------------------------------------------------------------------------------------");


            var lastNamePr = from e in employeeList where e.LastName.EndsWith("%") select e;
            foreach (var res in lastNamePr)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("40----------------------------------------------------------------------------------------------");



            var rep = employeeList.Select(a => a.LastName).ToList();
            foreach (var res in rep)
            {
                Console.WriteLine("{0}");
            }
            Console.WriteLine("41----------------------------------------------------------------------------------------------");



            var dep = from e in employeeList  where e.Department == e.Department select e;
            foreach (var res in dep)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("42----------------------------------------------------------------------------------------------");

            var sal = from e in employeeList where e.Department == e.Department select e;
            foreach (var res in sal)
            {
                Console.WriteLine("{0},{1},{2},{3},{4}", res.FirstName, res.LastName, res.JoiningDate, res.Salary, res.Department);
            }
            Console.WriteLine("43----------------------------------------------------------------------------------------------");

            var total = from e in employeeList orderby e.Salary select new { e.EmployeeId,e.Department };
            int emp = total.Count();
            foreach (var res in dep)
            {
                Console.WriteLine("{0},{1}",res.Department,emp);
            }
            Console.WriteLine("44----------------------------------------------------------------------------------------------");

            var tot = from e in employeeList where e.Department == e.Department select new { e.EmployeeId };
            int em = total.Count();
            foreach (var res in dep)
            {
                Console.WriteLine("{0},{1}", res.Department, emp);
            }
            Console.WriteLine("45----------------------------------------------------------------------------------------------");

            /*var max = from e in employeeList where e.Department == e.Department select new { e.Salary };
            var m = max.Max();
            foreach (var res in dep)
            {
                Console.WriteLine("{0},{1}", res.Department, m);
            }
            Console.WriteLine("46----------------------------------------------------------------------------------------------");
*/
            var minSalary = (from e in employeeList
                             group e by new { e.Department } into department
                             select new
                             {
                                 department,
                                 averageSalary = department.Min(s => s.Salary)
                             }).OrderByDescending(t => t.averageSalary);
            foreach (var res in minSalary)
            {
                Console.WriteLine("{0},{1}", res.department ,res.averageSalary);
            }
            Console.WriteLine("46----------------------------------------------------------------------------------------------");



            var number = from e in employeeList where e.JoiningDate == e.JoiningDate select e;
            var no = number.Count();
            foreach (var res in dep)
            {
                Console.WriteLine("{0},{1}", res.Department, no);
            }
            Console.WriteLine("47----------------------------------------------------------------------------------------------");

            var join = from e in employeeList
                       join t in incentivesList on e.EmployeeId equals t.EmployeeId
                       select new
                       {
                           fName = e.FirstName,
                           inc = t.IncentivesAmount,
                       };
           
            foreach (var res in join)
            {
                Console.WriteLine("{0},{1}", res.fName , res.inc);
            }
            Console.WriteLine("48----------------------------------------------------------------------------------------------");


            var join2 = from e in employeeList
                       join t in incentivesList on e.EmployeeId equals t.EmployeeId
                       where t.IncentivesAmount >300000
                       select new
                       {
                           fName = e.FirstName,
                           inc = t.IncentivesAmount,
                       };

            foreach (var res in join2)
            {
                Console.WriteLine("{0},{1}", res.fName, res.inc);
            }
            Console.WriteLine("50----------------------------------------------------------------------------------------------");


            var join3 = from e in employeeList
                        join t in incentivesList on e.EmployeeId equals t.EmployeeId
                        where t.IncentivesAmount == null
                        select new
                        {
                            fName = e.FirstName,
                            inc = t.IncentivesAmount,
                        };

            foreach (var res in join3)
            {
                Console.WriteLine("{0},{1}", res.fName, res.inc);
            }
            Console.WriteLine("52----------------------------------------------------------------------------------------------");


            /*var join4 = from e in employeeList
                        join t in incentivesList on e.EmployeeId equals t.EmployeeId
                        let t.IncentivesAmount 
                        select new
                        {
                            fName = e.FirstName,
                            inc = t.IncentivesAmount,
                        };

            foreach (var res in join3)
            {
                Console.WriteLine("{0},{1}", res.fName, res.inc);
            }
            Console.WriteLine("52----------------------------------------------------------------------------------------------");
*/

            var top2 = (from e in employeeList orderby e.Salary descending select e).Take(2);
            
            foreach (var res in top2)
            {
                Console.WriteLine("{0}", res.Salary);
            }
            Console.WriteLine("----------------------------------------------------------------------------------------------");


            var hi2 = (from e in employeeList orderby e.Salary descending select e).Take(2).TakeLast(1);

            foreach (var res in hi2)
            {
                Console.WriteLine("{0}", res.Salary);
            }
            Console.WriteLine("----------------------------------------------------------------------------------------------");

            var salpr = from e in employeeList
                        select new
                        {
                          name1 =  e.FirstName == "John",
                            name2 = e.FirstName=="Roy",
                            name3 = e.FirstName == ""

                        };

            return employeeList;
        }

           
       


    }
}
