import System.Environment
import Control.Applicative ((<*),(*>))
import Text.Parsec hiding (crlf)
import Text.Parsec.String

csv :: Parser [[String]]
csv = sepBy1 record crlf

record :: Parser [String]
record = sepBy1 field comma

field :: Parser String
field = escaped <|> nonEscaped

escaped :: Parser String
escaped = dquote *> many (textdata <|> comma <|> cr <|> lf <|> try (dquote *> dquote)) <* dquote

nonEscaped :: Parser String
nonEscaped = many textdata

-- ATOM

comma :: Parser Char
comma = char ','

lf :: Parser Char
lf = char '\n'

cr :: Parser Char
cr = char '\r'

crlf :: Parser Char
crlf = cr *> lf <|> lf
-- crlf = cr *> lf

dquote :: Parser Char
dquote = char '"'

textdata :: Parser Char
textdata = oneOf (" !" ++ ['#'..'+'] ++ ['-'..'~'])

-- 

readExpr:: String -> String
readExpr input = case parse parseExpr "csv" input of
    Left err -> "No match" ++ show err
    Right val -> show val

parseExpr = csv

main:: IO()
main = do args <- getArgs
          putStrLn (readExpr (args !! 0))
