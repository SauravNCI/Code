Top 10 Songs 2010


Last Updated: April 2026

Medium
ID 9650

130

Find the top 10 ranked songs in 2010. Output the rank, group name, and song name, but do not show the same song twice. Sort the result based on the rank in ascending order.

Table
billboard_top_100_year_end

select year_rank ,group_name,song_name from billboard_top_100_year_end b
where year=2010 and year_rank>=1 and year_rank<=10
group by year_rank,group_name,song_name order by year_rank
