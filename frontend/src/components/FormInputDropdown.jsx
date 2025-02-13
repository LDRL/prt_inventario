import { FormControl, InputLabel, MenuItem, Select } from "@mui/material";
import { Controller, Control } from "react-hook-form";




export const FormInputDropdown= ({
    name,
    control,
    label,
    rules,
    options
}) => {
    const generateSingleOptions = () => {
        return options.map((option) => {
            return (
                <MenuItem key={option.value} value={option.value}>
                    {option.label}
                </MenuItem>
            );
        });
    };

    return (
        <FormControl sx={{ mt: 2, minWidth: 200 }}>
            <InputLabel>{label}</InputLabel>
            <Controller
                render={({ field: { onChange, value } }) => (
                    <Select onChange={onChange} value={value}>
                        {generateSingleOptions()}
                    </Select>
                )}
                control={control}
                name={name}
            />
        </FormControl>
    );
};