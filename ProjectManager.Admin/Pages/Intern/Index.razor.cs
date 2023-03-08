using System;
using System.Linq;
using Microsoft.AspNetCore.Components;
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
using ProjectManager.Entity;
using BlazorInputFile;
using ProjectManager.Admin.Data;
using ProjectManager.Shared.Common.Enum;
using ProjectManager.Shared.Constants;
using ProjectManager.Shared.Model.Request;
using ProjectManager.Shared.Model.ViewModel;
using Radzen;
using Radzen.Blazor;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace ProjectManager.Admin.Pages.Intern
{
    
        public class IndexBase : CommonComponentBase
        {
            public InternRequest request { get; set; } = new InternRequest();
            public RadzenDataGrid<InternViewModel> grid;
            public IEnumerable<InternViewModel> data;
            public IEnumerable<Entity.Teacher> listTeacher { get; set; }

            public IEnumerable<Entity.SchoolYear> listSchoolYear { get; set; }

            public List<StatusViewModel> listStatus { get; set; }

            public bool isLoading;
            public int count;
            public int pageSize = 10;
            public int? page = 1;
            protected override async Task OnInitializedAsync()
            {
                Logout();
                isLoading = true;
                request.Status = (long)StatusEnum.All;
                var teacher = await _teacherService.GetAllTeacherAsync(token);
                listTeacher = teacher.Data;
                var schoolYear = await _schoolYearService.GetAllSchoolYearAsync(token);
                listSchoolYear = schoolYear.Data;
                listStatus = _internService.GetAllListStatusAsync();
            }

            public async Task LoadData(LoadDataArgs args)
            {
                isLoading = true;
                page = (args.Skip + pageSize) / pageSize;
                request.PageSize = pageSize;
                request.Page = page;
                if (internStatus > 0)
                {
                    request.Status = internStatus;
                }

                var result = await _internService.GetAllAsync(request, token);
                var message = new NotificationMessage();
                if (result.ResponseCode == 200)
                {
                    data = result.Data;
                    count = result.TotalRecords;
                    internStatus = -3;
                }
                else
                {
                    message.Severity = NotificationSeverity.Error;
                    message.Summary = Constants.Message.Fail;
                    message.Detail = result.ResponseMessage;
                    message.Duration = 4000;
                    _notificationService.Notify(message);
                }

                await Delay();
                isLoading = false;
            }

            public async Task OnSearch()
            {
                await grid.FirstPage();
            }
        public async Task ShowModal(InternViewModel data)
        {
            await _dialogService.OpenAsync<InternModal>("Xem dữ liệu",
            new Dictionary<string, object>() { { "internViewModel", data }, { "grid", grid } });
        }
    }
    }
