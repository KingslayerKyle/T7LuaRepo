local PostLoadFunc = function ( self, controller )
	
end

CoD.friendsListWidget = InheritFrom( LUI.UIElement )
CoD.friendsListWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.friendsListWidget )
	self.id = "friendsListWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 65 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local bg = LUI.UIImage.new()
	bg:setLeftRight( true, true, 0, 0 )
	bg:setTopBottom( true, true, 0, 0 )
	bg:setRGB( 0.31, 0.28, 0.28 )
	bg:setAlpha( 0.51 )
	bg:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bg )
	self.bg = bg
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 64 )
	emblem:setTopBottom( true, false, 0, 64 )
	emblem:setRGB( 1, 1, 1 )
	emblem:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( emblem )
	self.emblem = emblem
	
	local rankIcon = LUI.UIImage.new()
	rankIcon:setLeftRight( false, true, -43.5, -11.5 )
	rankIcon:setTopBottom( true, false, 7, 39 )
	rankIcon:setRGB( 1, 1, 1 )
	rankIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( rankIcon )
	self.rankIcon = rankIcon
	
	local friendName = LUI.UITightText.new()
	friendName:setLeftRight( true, false, 78.5, 131.5 )
	friendName:setTopBottom( true, false, 7, 32 )
	friendName:setRGB( 1, 1, 1 )
	friendName:setTTF( "fonts/default.ttf" )
	self:addElement( friendName )
	self.friendName = friendName
	
	local Label0 = LUI.UITightText.new()
	Label0:setLeftRight( true, false, 78.5, 123.5 )
	Label0:setTopBottom( true, false, 39, 64 )
	Label0:setRGB( 1, 1, 1 )
	Label0:setTTF( "fonts/default.ttf" )
	self:addElement( Label0 )
	self.Label0 = Label0
	
	local Label1 = LUI.UITightText.new()
	Label1:setLeftRight( true, false, 327.5, 347.5 )
	Label1:setTopBottom( true, false, 10.5, 35.5 )
	Label1:setRGB( 1, 1, 1 )
	Label1:setTTF( "fonts/default.ttf" )
	self:addElement( Label1 )
	self.Label1 = Label1
	
	self.emblem:linkToElementModel( self, "emblem", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			emblem:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.rankIcon:linkToElementModel( self, "rankIcon", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			rankIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self.friendName:linkToElementModel( self, "name", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			friendName:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Label0:linkToElementModel( self, "status", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.Label1:linkToElementModel( self, "rank", true, function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			Label1:setText( Engine.Localize( modelValue ) )
		end
	end )
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				bg:completeAnimation()
				self.bg:setRGB( 0.31, 0.28, 0.28 )
				self.clipFinished( bg, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				bg:completeAnimation()
				self.bg:setRGB( 0.79, 0.44, 0.02 )
				self.clipFinished( bg, {} )
			end
		}
	}
	self.close = function ( self )
		self.emblem:close()
		self.rankIcon:close()
		self.friendName:close()
		self.Label0:close()
		self.Label1:close()
		CoD.friendsListWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

