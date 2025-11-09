CoD.ServerBrowserPlayerRow = InheritFrom( LUI.UIElement )
CoD.ServerBrowserPlayerRow.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ServerBrowserPlayerRow )
	self.id = "ServerBrowserPlayerRow"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 350 )
	self:setTopBottom( true, false, 0, 25 )
	
	local background = LUI.UIImage.new()
	background:setLeftRight( true, true, 0, 0 )
	background:setTopBottom( true, true, 0, 0 )
	background:setRGB( 0.2, 0.2, 0.2 )
	self:addElement( background )
	self.background = background
	
	local name = LUI.UIText.new()
	name:setLeftRight( true, false, 5, 257 )
	name:setTopBottom( true, false, 3.5, 21.5 )
	name:setTTF( "fonts/default.ttf" )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	name:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	name:linkToElementModel( self, "name", true, function ( model )
		local _name = Engine.GetModelValue( model )
		if _name then
			name:setText( Engine.Localize( _name ) )
		end
	end )
	self:addElement( name )
	self.name = name
	
	local timePlayed = LUI.UIText.new()
	timePlayed:setLeftRight( true, false, 257, 347 )
	timePlayed:setTopBottom( true, false, 3.5, 21.5 )
	timePlayed:setTTF( "fonts/default.ttf" )
	timePlayed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_RIGHT )
	timePlayed:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	timePlayed:linkToElementModel( self, "timePlayed", true, function ( model )
		local _timePlayed = Engine.GetModelValue( model )
		if _timePlayed then
			timePlayed:setText( Engine.Localize( SecondsAsTimePlayedStringShort( _timePlayed ) ) )
		end
	end )
	self:addElement( timePlayed )
	self.timePlayed = timePlayed
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				background:completeAnimation()
				self.background:setRGB( 0.2, 0.2, 0.2 )
				self.clipFinished( background, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.name:close()
		element.timePlayed:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

