#!//bin/bash

read -p "Enter First Name: " first_name
read -p "Enter Last Name: " last_name
read -p "Enter Company: " company
read -p "Enter Job Title: " job_title
read -p "Email: " email
read -p "Forecast $: " forecast

stage_choices=("Created" "Responded" "Meeting Complete" "Aligned" "Demo" "POC" "Negotiation" "Contract Complete" "Closed Won" "Closed Lost")

PS3="Select lead stage (enter the number): "
select choice in "${stage_choices[@]}"; do
  case "$choice" in
    "Created")
      stage=${choice}
      win_probability="0.01"
      break
      ;;
    "Responded")
      stage=${choice}
      win_probability="1.00"
      break
      ;;
    "Meeting Complete")
      stage=${choice}
      win_probability="5.00"
      break
      ;;
    "Aligned")
      stage=${choice}
      win_probability="10.00"
      break
      ;;
    "Demo")
      stage=${choice}
      win_probability="20.00"
      break
      ;;
    "POC")
      stage=${choice}
      win_probability="40.00"
      break
      ;;
    "Negotiation")
      stage=${choice}
      win_probability="60.00"
      break
      ;;
    "Contract Complete")
      stage=${choice}
      win_probability="80.00"
      break
      ;;
    "Closed Won")
      stage=${choice}
      win_probability="100.00"
      break
      ;;
    "Closed Lost")
      stage=${choice}
      win_probability="0.00"
      break
      ;;
    *)
      echo "Invalid stage. Please select a valid option."
      ;;
  esac
done

today=$(date '+%Y-%m-%d %H:%M:%S')

markdown="| $first_name | $last_name | $company | $job_title | $today | $email | $stage | $win_probability | $forecast | $today |"

output_file="leads.md"

echo $markdown

echo "${markdown}" >> $output_file

echo "New lead $first_name $last_name added to $output_file"