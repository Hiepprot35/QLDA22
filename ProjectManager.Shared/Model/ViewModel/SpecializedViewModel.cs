using ProjectManager.Entity;

namespace ProjectManager.Shared.Model.ViewModel
{
    public class SpecializedViewModel : Specialized
    {
        public long STT { get; set; }
        public long TotalRow { get; set; }
        public string DepartmentName { get; set; }
    }
}
