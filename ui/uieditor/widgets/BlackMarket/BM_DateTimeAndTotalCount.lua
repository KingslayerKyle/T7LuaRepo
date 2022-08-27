-- 44187aa477158e592a58a58dd52d01a2
-- This hash is used for caching, delete to decompile the file again

CoD.BM_DateTimeAndTotalCount = InheritFrom( LUI.UIElement )
CoD.BM_DateTimeAndTotalCount.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_DateTimeAndTotalCount )
	self.id = "BM_DateTimeAndTotalCount"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 247 )
	self:setTopBottom( true, false, 0, 43 )
	
	local backing = LUI.UIImage.new()
	backing:setLeftRight( true, false, -32.5, 279.5 )
	backing:setTopBottom( true, false, -2.5, 45.5 )
	backing:setImage( RegisterImage( "uie_t7_blackmarket_common_timedate_backing" ) )
	self:addElement( backing )
	self.backing = backing
	
	local dateTimeReceived = LUI.UIText.new()
	dateTimeReceived:setLeftRight( false, false, -122, 122 )
	dateTimeReceived:setTopBottom( true, false, 5, 22 )
	dateTimeReceived:setTTF( "fonts/escom.ttf" )
	dateTimeReceived:setLetterSpacing( 0 )
	dateTimeReceived:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	dateTimeReceived:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_MIDDLE )
	dateTimeReceived:linkToElementModel( self, "dateTime", true, function ( model )
		local dateTime = Engine.GetModelValue( model )
		if dateTime then
			dateTimeReceived:setText( Engine.Localize( dateTime ) )
		end
	end )
	self:addElement( dateTimeReceived )
	self.dateTimeReceived = dateTimeReceived
	
	local TotalCount = LUI.UIText.new()
	TotalCount:setLeftRight( false, false, -122.5, 122.5 )
	TotalCount:setTopBottom( true, false, 20, 38 )
	TotalCount:setTTF( "fonts/default.ttf" )
	TotalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TotalCount:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	TotalCount:linkToElementModel( self, "duplicateText", true, function ( model )
		local duplicateText = Engine.GetModelValue( model )
		if duplicateText then
			TotalCount:setText( Engine.Localize( duplicateText ) )
		end
	end )
	self:addElement( TotalCount )
	self.TotalCount = TotalCount
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setLeftRight( false, false, -122, 122 )
				self.dateTimeReceived:setTopBottom( true, false, 5, 22 )
				self.clipFinished( dateTimeReceived, {} )
				TotalCount:completeAnimation()
				self.TotalCount:setLeftRight( false, false, -122.5, 122.5 )
				self.TotalCount:setTopBottom( true, false, 20, 38 )
				self.clipFinished( TotalCount, {} )
			end
		},
		Condensed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				dateTimeReceived:completeAnimation()
				self.dateTimeReceived:setLeftRight( false, false, -122, 122 )
				self.dateTimeReceived:setTopBottom( true, false, -2, 15 )
				self.clipFinished( dateTimeReceived, {} )
				TotalCount:completeAnimation()
				self.TotalCount:setLeftRight( false, false, -122.5, 122.5 )
				self.TotalCount:setTopBottom( true, false, 12, 30 )
				self.clipFinished( TotalCount, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.dateTimeReceived:close()
		element.TotalCount:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

