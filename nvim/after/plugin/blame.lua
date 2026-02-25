require('gitblame').setup {
     --Note how the `gitblame_` prefix is omitted in `setup`
    enabled = true,
    message_template = "<date> • <author> • #<sha>",
    date_format = "%m-%d-%Y", 
    delay = 0, 
    virtual_text_column = 100,
}
