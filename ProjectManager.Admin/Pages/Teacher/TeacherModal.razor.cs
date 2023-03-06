using Microsoft.AspNetCore.Components;
using ProjectManager.Admin.Data;
using ProjectManager.Shared.Constants;
using ProjectManager.Shared.Model.ViewModel;
using Radzen;
using Radzen.Blazor;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ProjectManager.Admin.Pages.Teacher
{
    public class TeacherModalBase : CommonComponentBase
    {
        [Parameter] public RadzenDataGrid<TeacherViewModel> grid { get; set; }
        [Parameter] public TeacherViewModel teacherViewModel { get; set; }
        [Parameter] public IEnumerable<Entity.Department> listDepartment { get; set; }
        [Parameter] public IEnumerable<Entity.Specialized> listSpecialized { get; set; }
        public Entity.Teacher editModel { get; set; } = new Entity.Teacher();
        public bool isLoading;
        public bool isShow;

        protected override async Task OnInitializedAsync()
        {
            isLoading = true;

            if (teacherViewModel.Id > 0)
            {
                editModel.Id = teacherViewModel.Id;
                editModel.Username = teacherViewModel.Username;
                editModel.Name = teacherViewModel.Name;
                editModel.PhoneNumber = teacherViewModel.PhoneNumber;
                editModel.Email = teacherViewModel.Email;
                editModel.Address = teacherViewModel.Address;
                editModel.DateOfBirth = teacherViewModel.DateOfBirth;
                editModel.DepartmentId = teacherViewModel.DepartmentId;
                editModel.SpecializedId = teacherViewModel.SpecializedId;
                editModel.CreatedBy = teacherViewModel.CreatedBy;
                editModel.CreatedDate = teacherViewModel.CreatedDate;
                editModel.ModifiedBy = teacherViewModel.ModifiedBy;
                editModel.ModifiedDate = teacherViewModel.ModifiedDate;
                isShow = true;
            }
            else
            {
                isShow = false;
            }
            await Delay();
            isLoading = false;
        }

        public void Cancel()
        {
            _dialogService.Close(true);
        }

        public void OnInvalidSubmit(FormInvalidSubmitEventArgs args)
        {

        }

        public async Task OnSubmit()
        {
            var message = new NotificationMessage();
            message.Duration = 4000;

            editModel.CreatedBy = userName;
            if (editModel.Id > 0)
            {
                editModel.ModifiedBy = userName;
            }

            var result = await _teacherService.SaveAsync(editModel, token);

            if (result.ResponseCode == 200 && result.Data == true)
            {
                Cancel();
                message.Severity = NotificationSeverity.Success;
                message.Summary = Constants.Message.Successfully;
                await grid.Reload();
            }
            else
            {
                message.Severity = NotificationSeverity.Error;
                message.Summary = Constants.Message.Fail;
            }
            message.Detail = result.ResponseMessage;
            message.Duration = 4000;
            _notificationService.Notify(message);
        }
    }
}
