function header()

% checks if new script is open, opens one if not
doc = matlab.desktop.editor.getActive;
if isempty(doc)
    doc = matlab.desktop.editor.newDocument;
end

% checks if text exists, returns if there is
curr_text = doc.Text;
if ~isempty(strtrim(curr_text))
    disp('File is not empty. Header not added.');
    return;
end

% header
curr_date = char(datetime('today', 'Format', 'MMMM dd yyyy'));
header_text = {
    '% <add desc here>'
    '% Alessandro Mordasiewicz'
    ['% Date: ' curr_date]
    ''
};

% add header
new_text = strjoin([header_text; {curr_text}], newline);
doc.Text = new_text;
disp(['Header added.']);