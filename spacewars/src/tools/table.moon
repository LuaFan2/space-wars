table.ExplodeByTags = (text, seperator, open, close, bRemoveTag) ->
    results = {}
    current = ""
    tag = nil

    text = string.gsub(text, "%s+", " ")
    
    for i = 1, #text
        character = string.sub(text, i, i)
        
        if not tag
            if character == open
                if not bRemoveTag
                    current = current .. character
                tag = true
            elseif character == seperator
                results[#results + 1] = current
                current = ""
            else
                current = current .. character
        else
            if character == close
                if not bRemoveTag
                    current = current .. character
                
                tag = nil
            else
                current = current .. character

    if current ~= ""
        results[#results + 1] = current
    
    results