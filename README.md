API Request: Get KPI Values
This document provides a cURL example for fetching KPI values from the getKPIValuesByLines endpoint.

cURL Command
This command executes a POST request with the required headers and a JSON body.

Bash

curl -X POST 'https://asaichi.dnha.ap.fiot.globaldenso.com/api/widgets/getKPIValuesByLines' \
-H 'Content-Type: application/json' \
-H 'api-key: 3082010A0282010100E1C31BB7EE4280D5AC0CB69ABE4593615B28165D074E8EED2AF5AA7EC1CB7F10D09AB6D8319E5A9DAD87D6CC484719AC72BB8FB19770FA37FE054F3D25A4FF9AB665BFC3B3884B766FDC758BFF47F5F0BB6D6075871273B4181E11AB07FAF82F984EBD9DD5C0B7FD3C91B0F0F7CB7509F252191678567FF5B7312DBE3AB6EB5A96A75FC52F6E938C0B1790C8AA2366B8CDEC7AEFAB5DCEE0BEEBC0ADC3281694B4922FBE43AB2A9AE30AE430491ABFEA6FFC28FFB2EBD713F95460BEDE5C62D27E426A98439C997CAA09362A4E65196E8E1732019937C3769BD4786B89E7AAC2542843659D9ADA7B7E962A427141FA71BA4F2F851541A353B2F449FE98C79ACD0203010001' \
-d '{"startDate": "2025-11-91", "endDate": "2026-11-01", "kpiDepartment": [{"id": "PRD-ETB", "lineIds": ["ETB D-6 Line-3"]}], "kpiNames": "S"}'
⚠️ Important Notes
The request body (-d flag) in this example is based on screenshot data that may contain typos. You may need to correct the following fields for the API call to succeed:

"startDate": "2025-11-91": This is an invalid date. You will likely need to correct "91" to a valid day.

"lineIds": The API may be case-sensitive. The first example in the documentation used linelds (lowercase 'l'). Ensure you are using the correct field name.

"kpiNames": "S": The first example used a number (1). Using the string "S" may or may not be valid.





db.users.insertOne({
  email: "admin@iotcore.com",
  password_hash: "$2b$12$Nj5PfiWH5JSnG22v7fb4wObrhP2HcElnvZ/YNFV6hBab6IEKTr2pq",
  role: "SUPER_ADMIN",
  customer_name: null,
  created_at: new Date(),
  updated_at: new Date(),
  status: "active"
})
