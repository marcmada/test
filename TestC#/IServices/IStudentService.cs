using TestC_.DTOs;

namespace TestC_.IServices
{
    public interface IStudentService
    {
        Task<List<StudentMarks>> GetAllMarksForStudent(int studentId);
        Task<string> GetAverageMark(int studentId);
    }
}
