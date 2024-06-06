-- Get out of terminal mode by pressing escape
vim.keymap.set("t", "<Esc>", "<C-\\><C-n> :FloatermHide<CR>", { noremap = true, silent = true})

vim.keymap.set("n", "<leader>w1", ":FloatermToggle --floaterm_name=1 --N=1<CR>")
vim.keymap.set("n", "<leader>w2", ":FloatermToggle --floaterm_name=2 --N=2<CR>")
vim.keymap.set("n", "<leader>w3", ":FloatermToggle --floaterm_name=3 --N=3<CR>")

-- Define the find_up function
local function find_up(filename, max_levels)
    -- Get the current file's directory
    local current_dir = vim.fn.expand('%:p:h')

    -- Loop through parent directories up to the specified limit
    for _ = 1, max_levels do
        -- Check if the file exists in the current directory
        local file_path = current_dir .. '/' .. filename
        if vim.fn.filereadable(file_path) == 1 then
            return current_dir
        end

        -- Move to the parent directory
        local parent_dir = vim.fn.fnamemodify(current_dir, ':h')
        if parent_dir == current_dir then
            break -- Stop if we can't go up anymore
        end
        current_dir = parent_dir
    end

    -- Return nil if the file was not found
    return nil
end

local function handle_build(build_file, build_command)
    local parent_folder = find_up(build_file, 10)
    if parent_folder then
        print("Parent dir: " .. parent_folder)
        vim.cmd(":FloatermToggle --floaterm_name=1 --N=1<CR>")
        vim.cmd(":FloatermSend --floaterm_name=1 " .. "cd " .. parent_folder .. " && " .. build_command)
    end
end

-- Custom build commands go here
local rust_build = "cargo build"
vim.keymap.set("n", "<leader>bb", function () handle_build("Cargo.toml", "cargo build") end)
