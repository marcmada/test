﻿using Microsoft.AspNetCore.Mvc;
using TestC_.IServices;

namespace TestC_.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class StudentController : Controller
    {
        private readonly IStudentService _studentService;

        public StudentController(IStudentService studentService)
        {
            _studentService = studentService;
        }

        [HttpGet("{studentId:int}")]
        public async Task<IActionResult> GetAverageMark([FromRoute] int studentId)
        {
            return Ok(await _studentService.GetAverageMark(studentId));
        }
    }
}