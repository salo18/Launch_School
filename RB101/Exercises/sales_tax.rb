# number validation

def prompt(msg)
  puts "=> #{msg}"
end

SD_TAX_RATE = 0.005
CA_TAX_RATE = 0.0725

prompt("Welcome to CA sales tax calculator. Get ready, we'll be finishing up the tax filing soon!")

prompt("To complete the return, download the sales report for this quarter from Shopify and Amazon.")

prompt("Shopify net sales:")
shopify_net_sales = gets.chomp.to_f

prompt("Shopify sales tax:")
shopify_sales_tax = gets.chomp.to_f

total_shopify_sales = (shopify_net_sales + shopify_sales_tax)

prompt("Total Shopify sales = #{total_shopify_sales}")

prompt("Amazon total sales:")
amazon_total_sales = gets.chomp.to_f

prompt("Amazon marketplace facilitated sales tax (not included in the total):")
amazon_sales_tax = gets.chomp.to_f

prompt("Total Amazon sales (does not include tax) = #{amazon_total_sales}")

total_gross_sales = total_shopify_sales + amazon_total_sales

prompt("Total Gross Sales (enter this on page 1) = #{total_gross_sales}")

prompt("Go to Shopify > Reports > Finances > Taxes.")

prompt("Sales tax collected in CA (outside SD):")
shopify_tax_ca = gets.chomp.to_f

prompt("Sales tax collected in SD:")
shopify_tax_sd = gets.chomp.to_f

shopify_sales_sd = shopify_tax_sd / SD_TAX_RATE
shopify_sales_ca = shopify_tax_ca / CA_TAX_RATE

prompt("Shopify CA sales outside SD = #{shopify_sales_ca}")
prompt("Shopify CA sales inside SD = #{shopify_sales_sd}")

total_sales_ca = shopify_sales_ca + shopify_sales_sd

prompt("Total sales in CA = #{total_sales_ca}")

interstate_commerce = shopify_net_sales - total_sales_ca + amazon_total_sales

prompt("Interstate Commerce = #{interstate_commerce}")
prompt("Sales tax included in total sales = #{shopify_sales_tax}")


prompt("Here is the info needed to complete the return:")
prompt("Total Gross Sales (enter this on page 1) = #{total_gross_sales}")
prompt("Interstate Commerce (enter this on page 3) = #{interstate_commerce}")
prompt("San Diego taxable amount at .5% = #{shopify_sales_sd}")
prompt("Transactions subject only to state rate of 7.25% = #{shopify_sales_ca}")





