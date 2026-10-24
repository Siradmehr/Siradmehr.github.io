function hfun_bar(vname)
  val = Meta.parse(vname[1])
  return round(sqrt(val), digits=2)
end

function hfun_m1fill(vname)
  var = vname[1]
  return pagevar("index", var)
end

function lx_baz(com, _)
  # keep this first line
  brace_content = Franklin.content(com.braces[1]) # input string
  # do whatever you want here
  return uppercase(brace_content)
end


using Dates

html_escape(s) = replace(string(s), "&" => "&amp;", "<" => "&lt;", ">" => "&gt;", "\"" => "&quot;")

# List Markdown posts using their publication dates, newest first.
function hfun_blogposts()
    posts = NamedTuple[]
    for file in readdir("blog")
        endswith(file, ".md") && file != "index.md" || continue
        path = "blog/" * splitext(file)[1]
        pagevar(path, "is_post") === true || continue
        date = pagevar(path, "date")
        date isa Date || error("Blog post $path must define a date.")
        push!(posts, (path=path, date=date, title=pagevar(path, "title")))
    end
    isempty(posts) && return "<p>No posts yet.</p>"
    sort!(posts; by=p -> (p.date, p.path), rev=true)
    io = IOBuffer()
    write(io, "<ul>")
    for post in posts
        title = html_escape(something(post.title, "Untitled post"))
        date = Dates.format(post.date, dateformat"d U yyyy")
        write(io, """<li>$date — <a href="/$(post.path)/">$title</a></li>""")
    end
    write(io, "</ul>")
    return String(take!(io))
end
