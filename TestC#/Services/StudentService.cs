using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using TestC_.DTOs;
using TestC_.IServices;
using TestC_.Models;

namespace TestC_.Services
{
    public class StudentService : IStudentService
    {
        private readonly UniversitateContext _universitateContext;

        public StudentService(UniversitateContext universitateContext)
        {
            _universitateContext = universitateContext;
        }

        public async Task<string> GetAverageMark(int studentId)
        {
            var studentMarks = await _universitateContext.Notes
                .Where(n => n.IdStudent == studentId)
                .OrderBy(n => n.IdMaterie)
                .ToListAsync();
            var courses = studentMarks
                .Select(s => s.IdMaterie)
                .Distinct()
                .ToList();
            studentMarks.Reverse();

            float sum = 0;

            foreach (var course in courses)
            {
                foreach (var mark in studentMarks)
                {
                    if (mark.IdMaterie == course)
                    {
                        sum += mark.Nota;
                        break;
                    }
                }
            }

            return (sum/courses.Count).ToString("0.00");
        }

        //public async Task<List<StudentMarks>> GetAll(int studentId)
        //{
        //    var studentMarks = await _universitateContext.Notes
        //        .Where(n => n.IdStudent == studentId)
        //        .ToListAsync();
        //}
    }
}
