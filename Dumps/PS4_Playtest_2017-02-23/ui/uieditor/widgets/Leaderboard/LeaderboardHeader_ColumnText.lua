CoD.LeaderboardHeader_ColumnText = InheritFrom( LUI.UIElement )
CoD.LeaderboardHeader_ColumnText.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.LeaderboardHeader_ColumnText )
	self.id = "LeaderboardHeader_ColumnText"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 141 )
	self:setTopBottom( 0, 0, 0, 24 )
	
	local ColumnText = LUI.UIText.new()
	ColumnText:setLeftRight( 0, 0, 0, 140 )
	ColumnText:setTopBottom( 0, 0, 0, 24 )
	ColumnText:setRGB( 0.64, 0.64, 0.64 )
	ColumnText:setText( Engine.Localize( "8888888888" ) )
	ColumnText:setTTF( "fonts/UnitedSansSmCdMd.ttf" )
	ColumnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ColumnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	LUI.OverrideFunction_CallOriginalFirst( ColumnText, "setText", function ( element, text )
		if IsTextWrapping( self, element ) then
			SetState( self, "ColumnTextWrapped" )
		elseif not IsTextWrapping( self, element ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( ColumnText )
	self.ColumnText = ColumnText
	
	self.resetProperties = function ()
		ColumnText:completeAnimation()
		ColumnText:setLeftRight( 0, 0, 0, 140 )
		ColumnText:setTopBottom( 0, 0, 0, 24 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ColumnTextWrapped = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ColumnText:completeAnimation()
				self.ColumnText:setLeftRight( 0, 0, 0, 140 )
				self.ColumnText:setTopBottom( 0, 0, -15, 9 )
				self.clipFinished( ColumnText, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "ColumnTextWrapped",
			condition = function ( menu, element, event )
				return IsSelfInState( self, "ColumnTextWrapped" )
			end
		}
	} )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

