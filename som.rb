<div class="row margin-bottom">
<div class="col-lg-12 vertical-align">
<label class="label_title numbering_field">Is the company onboarded in the system?</label>
  <div class="checkbox-container">
    <div class="checkbox">
      <label>
        <%= render "client_portal_temp/field_input_type_radio", {
          :name_attr             => 'doc_form_iqq_profiling_process_first_profile_questionnaire[company_registered]',
          :initial_value         => 1,
          :compare_checked_value => 1,
          :checked_by_default    => '',
          :value                 => @doc_form_iqq_profiling_process_first_profile_questionnaire.company_registered,
          :class_attr            => 'radio'
        } %>
        <%= t 'generic.yes_label' %>
      </label>
    </div>
    <div class="checkbox">
      <label>
        <%= render "client_portal_temp/field_input_type_radio", {
          :name_attr             => 'doc_form_iqq_profiling_process_first_profile_questionnaire[company_registered]',
          :initial_value         => 0,
          :compare_checked_value => 0,
          :checked_by_default    => '',
          :value                 => @doc_form_iqq_profiling_process_first_profile_questionnaire.company_registered,
          :class_attr            => 'radio'
        } %>
        <%= t 'generic.no_label' %>
      </label>
    </div>
    <div class="clearfix"></div>
  </div>
</div>
</div>

<div class="row margin-bottom">
<div class="col-lg-12 vertical-align" id="firm_input" class="form-group">
<label class="label_title numbering_field">Your Company Name</label>
  <%= render "client_portal_temp/field_input_type_text", {
    :id_attr     => 'company_country_no',
    :name_attr   => 'doc_form_iqq_profiling_process_first_profile_questionnaire[company_name]',
    :class_attr  => 'form-control full_width',
    :placeholder => '',
    :value       => @doc_form_iqq_profiling_process_first_profile_questionnaire.company_name
  } %>
</div>
</div>   


<div class="row margin-bottom">
<div class="col-lg-12 vertical-align" id="firm_select" class="form-group">
<label class="label_title numbering_field">Company Name</label>
    <%= render "client_portal_temp/field_input_type_select", {
        :id_attr            => 'company_country_yes',
        :name_attr          => 'doc_form_iqq_profiling_process_first_profile_questionnaire[company_name]',
        :class_attr         => 'form-control full_width',
        :default_option     => true,
        :checked_by_default => '',
        :force_checked      => false,
        :options            => options_from_collection_for_select(DocFormIqqProfilingProcessFirstProfileQuestionnaire.company_get, :name, :name, selected: @doc_form_iqq_profiling_process_first_profile_questionnaire.company_name),
        :value              => @doc_form_iqq_profiling_process_first_profile_questionnaire.company_name
    } %>
</div>
</div>  

function firmRegCheck() {
  let sel = $('#firm_select');
  let inp = $('#firm_input');
  let val = $("input[name='doc_form_iqq_profiling_process_first_profile_questionnaire[company_registered]']:checked").val();

    if (val === '1') {
        sel.show().find('select').prop('disabled', false);
        inp.hide().find('input').prop('disabled', true);
    } else {
        sel.hide().find('select').prop('disabled', true);
        inp.show().find('input').prop('disabled', false);
    }
  }

$(document).ready(function () {
    firmRegCheck();
});

$(document).on("change", "input[name='doc_form_iqq_profiling_process_first_profile_questionnaire[company_registered]']", function () {
    firmRegCheck();
});

<style>
   #firm_select, #firm_input {
    display: none;
  }
  .company-container .company-block {
    margin-top: 4px;
  }
  .company-container .company-yes-no-block {
    width: 50px;
    margin-right: 15px;
  }
  .company-container .form-check-input {
    margin-right: 10px;
    margin-top: 6px;
  }
</style>

def self.company_get
  Firm.find_by_sql("select * from firms as f where f.`status` >= 0 order by f.name")
end

"company_registered"                      => { "name" => "Is the company onboarded in the system?", "type" => "yes_no", "convert" => false },
