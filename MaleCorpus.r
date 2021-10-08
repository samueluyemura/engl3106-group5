# Easily change mirror if needed
gutenmirror <- "http://mirrors.xmission.com/gutenberg" 
# Load Male Corpus
MaleCorpus <- gutenberg_download(c(1399,1400,967,805,2638,82,36034,2833,996,17460,821,23058,
                                       1608,107,20533,53416,3155,15265,963,23727,524),
                                     mirror=gutenmirror,
                                     meta_fields = c("title", "author"))

# Clean beginning and end of all novels
MaleCorpus_cleaned <- MaleCorpus[-c(1:900, 21183:21344, 37772:37829, 49883:49931, 61282:61360, 100988:101158,
                                    137863:138070, 175056:177261, 214669:214699, 254514:254592, 274911:274918, 
                                    282986:283007, 310126:310699, 322972:323245, 334595:334740, 349087:349533,
                                    375519:375595, 390491:390500, 390960:391032, 408670:408729, 420524:420604), ]

# Tokenize with added column "line"
MCToken <- MaleCorpus_cleaned %>% 
  mutate(line = row_number()) %>% 
  unnest_tokens(word, text)