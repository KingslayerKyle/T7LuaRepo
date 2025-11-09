require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )

CoD.Social_CallingCard = InheritFrom( LUI.UIElement )
CoD.Social_CallingCard.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Social_CallingCard )
	self.id = "Social_CallingCard"
	self.soundSet = "ChooseDecal"
	self:setLeftRight( true, false, 0, 256 )
	self:setTopBottom( true, false, 0, 64 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, 0, 256 )
	backing:setTopBottom( true, false, 0, 64 )
	backing:setRGB( 1, 1, 1 )
	backing:setImage( RegisterImage( "uie_emblem_bg_default" ) )
	backing:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( backing )
	self.backing = backing
	
	local clantag = CoD.FE_LabelSubHeadingE.new( menu, controller )
	clantag:setLeftRight( true, false, 5, 76 )
	clantag:setTopBottom( true, false, 29.03, 51.03 )
	clantag:setRGB( 1, 1, 1 )
	clantag.FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	clantag.Label0:setRGB( 1, 1, 1 )
	clantag.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	clantag:linkToElementModel( self, "clantag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			clantag.Label0:setText( StringAsClanTag( modelValue ) )
		end
	end )
	self:addElement( clantag )
	self.clantag = clantag
	
	local gamertag = CoD.FE_LabelSubHeadingE.new( menu, controller )
	gamertag:setLeftRight( true, false, 5, 69 )
	gamertag:setTopBottom( true, false, 5, 25 )
	gamertag:setRGB( 1, 1, 1 )
	gamertag.FEListSubHeaderPanel0:setRGB( 0, 0, 0 )
	gamertag.Label0:setRGB( 1, 1, 1 )
	gamertag.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	gamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag.Label0:setText( modelValue )
		end
	end )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	self.close = function ( self )
		self.clantag:close()
		self.gamertag:close()
		CoD.Social_CallingCard.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

