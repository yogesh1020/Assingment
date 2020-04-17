create TABLE Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)

create TABLE Department
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)



create view vEmployeeDetails
as
Select Id, Name, Gender, DeptName
from tblEmployee 
inner join tblDepartment
on tblEmployee.DepartmentId = tblDepartment.DeptId



select * from vEmployeeDetails

alter trigger trUpdateView
on vEmployeeDetails
instead of update
as 
begin
set nocount on
if(UPDATE(deptname))
begin
declare @dept int
select  @dept = DeptId  from Department
inner join  inserted
on inserted.DeptName = Department.DeptName
end
if(UPDATE(name))
begin
 update Employee set Name = inserted.name
 from inserted 
 inner join Employee
 on Employee.Id = inserted.Id
 end
 end

Update vEmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1
