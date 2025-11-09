require( "ui.uieditor.widgets.Border" )

CoD.DebugLobbyListRow = InheritFrom( LUI.UIElement )
CoD.DebugLobbyListRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.DebugLobbyListRow )
	self.id = "DebugLobbyListRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 25 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local rowBorder = CoD.Border.new( menu, controller )
	rowBorder:setLeftRight( true, true, 0, 0 )
	rowBorder:setTopBottom( true, true, 0, 0 )
	rowBorder:setRGB( 1, 0.5, 0 )
	rowBorder:setAlpha( 0 )
	self:addElement( rowBorder )
	self.rowBorder = rowBorder
	
	local rowBackground = LUI.UIImage.new()
	rowBackground:setLeftRight( true, true, 0, 0 )
	rowBackground:setTopBottom( false, false, 12.5, -12.5 )
	rowBackground:setRGB( 1, 1, 1 )
	rowBackground:setAlpha( 0.2 )
	rowBackground:setImage( RegisterImage( "uie_mp_cac_grad_stretch" ) )
	rowBackground:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rowBackground )
	self.rowBackground = rowBackground
	
	local rowTopGlow = LUI.UIImage.new()
	rowTopGlow:setLeftRight( true, true, 0, 0 )
	rowTopGlow:setTopBottom( false, false, -12.5, -3.5 )
	rowTopGlow:setRGB( 1, 1, 1 )
	rowTopGlow:setAlpha( 0.44 )
	rowTopGlow:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rowTopGlow )
	self.rowTopGlow = rowTopGlow
	
	local colLeader = LUI.UIImage.new()
	colLeader:setLeftRight( false, true, -24, 0 )
	colLeader:setTopBottom( false, false, -12.5, 11.5 )
	colLeader:setRGB( 1, 1, 1 )
	colLeader:setImage( RegisterImage( "uie_ui_host" ) )
	colLeader:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( colLeader )
	self.colLeader = colLeader
	
	local colGamertag = LUI.UITightText.new()
	colGamertag:setLeftRight( true, false, 0, 208 )
	colGamertag:setTopBottom( false, false, -13.5, 11.5 )
	colGamertag:setRGB( 1, 1, 1 )
	colGamertag:setTTF( "fonts/default.ttf" )
	self:addElement( colGamertag )
	self.colGamertag = colGamertag
	
	self.colLeader:linkToElementModel( self, "isLeader", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colLeader:setAlpha( modelValue )
		end
	end )
	self.colGamertag:linkToElementModel( self, "gamertag", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			colGamertag:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				rowBorder:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.rowBorder:setAlpha( 0 )
				rowBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				rowBorder:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
				self.rowBorder:setAlpha( 1 )
				rowBorder:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
			end
		}
	}
	self.close = function ( self )
		self.rowBorder:close()
		self.colLeader:close()
		self.colGamertag:close()
		CoD.DebugLobbyListRow.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

