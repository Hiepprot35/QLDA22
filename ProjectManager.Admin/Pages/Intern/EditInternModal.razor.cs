using System;
using System.Linq;
using System.Net.Http;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Components.Authorization;
using Microsoft.AspNetCore.Components.Forms;
using Microsoft.AspNetCore.Components.Routing;
using Microsoft.AspNetCore.Components.Web;
using Microsoft.JSInterop;
using ProjectManager.Admin;
using ProjectManager.Admin.Shared;
using ProjectManager.Admin.Shared.Template;
using ProjectManager.Shared;
using ProjectManager.Shared.Common.Enum;
using ProjectManager.Shared.Model.Request;
using ProjectManager.Entity;
using BlazorInputFile;
using Microsoft.AspNetCore.Components;
using ProjectManager.Admin.Data;
using ProjectManager.Shared.Constants;
using ProjectManager.Shared.Model.ViewModel;
using Radzen;
using Radzen.Blazor;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ProjectManager.Admin.Pages.Intern
{
   
        public class InternModalEditBase : CommonComponentBase
        {
            [Parameter]
            public RadzenDataGrid<InternViewModel> grid { get; set; }

            [Parameter]
            public InternViewModel internViewModel { get; set; }

            [Parameter]
            public IEnumerable<Entity.Department> listDepartment { get; set; }

            [Parameter]
            public IEnumerable<Entity.SchoolYear> listSchoolYear { get; set; }

            [Parameter]
            public IEnumerable<Entity.Specialized> listSpecialized { get; set; }

            public Entity.Intern editModel { get; set; } = new Entity.Intern();
            public bool isLoading;
            public bool isShow;
            protected override async Task OnInitializedAsync()
            {
                isLoading = true;
                if (internViewModel.Id > 0)
                {
                    editModel.Id = internViewModel.Id;
                    editModel.Name = internViewModel.Name;
                    editModel.StudentId = internViewModel.StudentId;
                    editModel.TeacherId = internViewModel.TeacherId;
                    editModel.Point = internViewModel.Point;
                    editModel.CreatedBy = internViewModel.CreatedBy;
                    editModel.CreatedDate = internViewModel.CreatedDate;
                    editModel.ModifiedBy = internViewModel.ModifiedBy;
                    editModel.ModifiedDate = internViewModel.ModifiedDate;
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

                var result = await _internService.SaveAsync(editModel, token);
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
