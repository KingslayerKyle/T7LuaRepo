-- 1a60097c45bc57b4ca5227de7b52c500
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 94 )
	self:setTopBottom( true, false, 0, 20 )
	
	local ColumnText = LUI.UIText.new()
	ColumnText:setLeftRight( true, false, 0, 93.5 )
	ColumnText:setTopBottom( true, false, 0, 20 )
	ColumnText:setRGB( 0.64, 0.64, 0.64 )
	ColumnText:setText( Engine.Localize( "8888888888" ) )
	ColumnText:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	ColumnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	ColumnText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )

	LUI.OverrideFunction_CallOriginalFirst( ColumnText, "setText", function ( element, controller )
		if IsTextWrapping( self, element ) then
			SetState( self, "ColumnTextWrapped" )
		elseif not IsTextWrapping( self, element ) then
			SetState( self, "DefaultState" )
		end
	end )
	self:addElement( ColumnText )
	self.ColumnText = ColumnText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )

			end
		},
		ColumnTextWrapped = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				ColumnText:completeAnimation()
				self.ColumnText:setLeftRight( true, false, 0, 93.5 )
				self.ColumnText:setTopBottom( true, false, -10, 6 )
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

