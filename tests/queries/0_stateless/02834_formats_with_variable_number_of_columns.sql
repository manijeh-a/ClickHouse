select 'CSV';
select * from format(CSV, 'x UInt32, y UInt32', '1,1\n2\n\n3,3,3,3') settings input_format_csv_allow_variable_number_of_columns=1;
select * from format(CSV, '1,1\n2\n\n3,3,3,3') settings input_format_csv_allow_variable_number_of_columns=1;
select * from format(CSVWithNames, '"x","y"\n1,1\n2\n\n3,3,3,3') settings input_format_csv_allow_variable_number_of_columns=1;
select 'TSV';
select * from format(TSV, 'x UInt32, y UInt32', '1\t1\n2\n\n3\t3\t3\t3') settings input_format_tsv_allow_variable_number_of_columns=1;
select * from format(TSV, '1\t1\n2\n\n3\t3\t3\t3') settings input_format_tsv_allow_variable_number_of_columns=1;
select * from format(TSVWithNames, 'x\ty\n1\t1\n2\n\n3\t3\t3\t3') settings input_format_tsv_allow_variable_number_of_columns=1;
select 'JSONCompactEachRow';
select * from format(JSONCompactEachRow, 'x UInt32, y UInt32', '[1,1]\n[2]\n[]\n[3,3,3,3]') settings input_format_json_compact_allow_variable_number_of_columns=1;
select * from format(JSONCompactEachRow, '[1,1]\n[2]\n[]\n[3,3,3,3]') settings input_format_json_compact_allow_variable_number_of_columns=1;
select * from format(JSONCompactEachRowWithNames, '["x","y"]\n[1,1]\n[2]\n[]\n[3,3,3,3]') settings input_format_json_compact_allow_variable_number_of_columns=1;
select 'CustomSeparated';
set format_custom_escaping_rule='CSV', format_custom_field_delimiter='<field_delimiter>', format_custom_row_before_delimiter='<row_before_delimiter>', format_custom_row_after_delimiter='<row_after_delimiter>', format_custom_row_between_delimiter='<row_between_delimiter>', format_custom_result_before_delimiter='<result_before_delimiter>', format_custom_result_after_delimiter='<result_after_delimiter>';
select * from format(CustomSeparated, 'x UInt32, y UInt32', '<result_before_delimiter><row_before_delimiter>1<field_delimiter>1<row_after_delimiter><row_between_delimiter><row_before_delimiter>2<row_after_delimiter><row_between_delimiter><row_before_delimiter><row_after_delimiter><row_between_delimiter><row_before_delimiter>3<field_delimiter>3<field_delimiter>3<field_delimiter>3<row_after_delimiter><result_after_delimiter>') settings input_format_custom_allow_variable_number_of_columns=1;
select * from format(CustomSeparated, '<result_before_delimiter><row_before_delimiter>1<field_delimiter>1<row_after_delimiter><row_between_delimiter><row_before_delimiter>2<row_after_delimiter><row_between_delimiter><row_before_delimiter><row_after_delimiter><row_between_delimiter><row_before_delimiter>3<field_delimiter>3<field_delimiter>3<field_delimiter>3<row_after_delimiter><result_after_delimiter>') settings input_format_custom_allow_variable_number_of_columns=1;
select * from format(CustomSeparatedWithNames, '<result_before_delimiter><row_before_delimiter>"x"<field_delimiter>"y"<row_after_delimiter><row_between_delimiter><row_before_delimiter>1<field_delimiter>1<row_after_delimiter><row_between_delimiter><row_before_delimiter>2<row_after_delimiter><row_between_delimiter><row_before_delimiter><row_after_delimiter><row_between_delimiter><row_before_delimiter>3<field_delimiter>3<field_delimiter>3<field_delimiter>3<row_after_delimiter><result_after_delimiter>') settings input_format_custom_allow_variable_number_of_columns=1;

