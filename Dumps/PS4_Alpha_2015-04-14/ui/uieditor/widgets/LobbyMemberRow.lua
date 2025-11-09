require( "ui.uieditor.widgets.Border" )

CoD.LobbyMemberRow = InheritFrom( LUI.UIElement )
CoD.LobbyMemberRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.LobbyMemberRow )
	self.id = "LobbyMemberRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 360 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local rowBackground = LUI.UIImage.new()
	rowBackground:setLeftRight( true, true, 0, 0 )
	rowBackground:setTopBottom( true, true, 25, -25 )
	rowBackground:setRGB( 1, 1, 1 )
	rowBackground:setAlpha( 0.2 )
	rowBackground:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	rowBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rowBackground )
	self.rowBackground = rowBackground
	
	local gamertag = LUI.UITightText.new()
	gamertag:setLeftRight( true, false, 129, 353 )
	gamertag:setTopBottom( true, true, 0, 0 )
	gamertag:setRGB( 1, 1, 1 )
	gamertag:setTTF( "fonts/default.ttf" )
	self:addElement( gamertag )
	self.gamertag = gamertag
	
	local rank = LUI.UITightText.new()
	rank:setLeftRight( true, false, 6, 26 )
	rank:setTopBottom( true, true, 0, 0 )
	rank:setRGB( 1, 1, 1 )
	rank:setTTF( "fonts/default.ttf" )
	self:addElement( rank )
	self.rank = rank
	
	local clanTag = LUI.UITightText.new()
	clanTag:setLeftRight( true, false, 60, 130 )
	clanTag:setTopBottom( false, false, -12.5, 12.5 )
	clanTag:setRGB( 1, 1, 1 )
	clanTag:setTTF( "fonts/default.ttf" )
	self:addElement( clanTag )
	self.clanTag = clanTag
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( true, false, 30.77, 55.77 )
	rankIcon:setTopBottom( true, false, 0, 25 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, true, 1, -1 )
	Image0:setTopBottom( true, true, 1, -16 )
	Image0:setRGB( 1, 1, 1 )
	Image0:setAlpha( 0.44 )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	local Border0 = CoD.Border.new( menu, controller )
	Border0:setLeftRight( true, true, 0, 0 )
	Border0:setTopBottom( true, true, 0, 0 )
	Border0:setRGB( 1, 0.5, 0 )
	Border0:setAlpha( 0 )
	self:addElement( Border0 )
	self.Border0 = Border0
	
	self.gamertag:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			gamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.rank:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rank:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clanTag:linkToElementModel( self, "clanTag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			clanTag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				Border0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.Border0:setAlpha( 0 )
				Border0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				Border0:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.Border0:setAlpha( 1 )
				Border0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	self.close = function ( self )
		self.Border0:close()
		self.gamertag:close()
		self.rank:close()
		self.clanTag:close()
		self.rankIcon:close()
		CoD.LobbyMemberRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

