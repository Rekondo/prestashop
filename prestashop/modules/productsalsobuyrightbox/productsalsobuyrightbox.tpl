<div class="block">
	<h4>{l s='Customers also bought' mod='productsalsobuyrightbox'}</h4>
	<div class="block_content">
		<table>
		{foreach from=$product item='product' name=product}
			{assign var='productLink' value=$link->getProductLink($product.id_product, $product.link_rewrite)}
			<tr class="ajax_block_product">
				<td>
				 <a
				  href="{$productLink|escape:'htmlall':'UTF-8'}"
				  title="{$product.name|escape:'htmlall':'UTF-8'}: {$product.description_short|strip_tags|truncate:100:'...'}"
				 >
				  {$product.name|truncate:15:'..'|escape:'htmlall':'UTF-8'}

				 </a>
				</td>
				<td>{displayWtPrice p=$product.price}</td>
				<td><a class="button_mini ajax_add_to_cart_button" href="{$base_dir}cart.php?qty=1&amp;id_product={$product.id_product|intval}&amp;token={$static_token}&amp;add" rel="ajax_id_product_{$product.id_product|intval}" title="{l s='Add to cart'}">{l s='Buy'}</a></td>

				<!--
					<td><a href="{$productLink|escape:'htmlall':'UTF-8'}" title="{$product.legend|escape:'htmlall':'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'medium')}" alt="{$product.legend|escape:'htmlall':'UTF-8'}" /></a></td>
					<td><a href="{$productLink|escape:'htmlall':'UTF-8'}" title="{l s='More'}">{$product.description_short|strip_tags|truncate:100:'...'}</a></td>
				-->
			</tr>
			<tr>

			</tr
		{/foreach}
		</table>
	</div>
</div>
