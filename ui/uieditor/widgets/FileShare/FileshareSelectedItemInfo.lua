-- 4eeab06375608f1e98222ae262b0a696
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemAuthor" )
require( "ui.uieditor.widgets.FileShare.FileshareSelectedItemPublishedTime" )
require( "ui.uieditor.widgets.FileShare.FileshareStat" )

CoD.FileshareSelectedItemInfo = InheritFrom( LUI.UIElement )
CoD.FileshareSelectedItemInfo.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FileshareSelectedItemInfo )
	self.id = "FileshareSelectedItemInfo"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 418 )
	self:setTopBottom( true, false, 0, 84 )
	self.anyChildUsesUpdateState = true
	
	local BG = LUI.UIImage.new()
	BG:setLeftRight( true, false, 0, 418 )
	BG:setTopBottom( true, false, 0, 47 )
	BG:setRGB( 0, 0, 0 )
	BG:setAlpha( 0.5 )
	self:addElement( BG )
	self.BG = BG
	
	local FileshareSelectedItemAuthor0 = CoD.FileshareSelectedItemAuthor.new( menu, controller )
	FileshareSelectedItemAuthor0:setLeftRight( true, false, 4, 418 )
	FileshareSelectedItemAuthor0:setTopBottom( true, false, 3, 27 )
	FileshareSelectedItemAuthor0:linkToElementModel( self, "fileAuthorName", true, function ( model )
		local fileAuthorName = Engine.GetModelValue( model )
		if fileAuthorName then
			FileshareSelectedItemAuthor0.AuthorName:setText( fileAuthorName )
		end
	end )
	self:addElement( FileshareSelectedItemAuthor0 )
	self.FileshareSelectedItemAuthor0 = FileshareSelectedItemAuthor0
	
	local FileshareSelectedItemPublishedTime0 = CoD.FileshareSelectedItemPublishedTime.new( menu, controller )
	FileshareSelectedItemPublishedTime0:setLeftRight( true, false, 4, 351 )
	FileshareSelectedItemPublishedTime0:setTopBottom( true, false, 27, 45 )
	FileshareSelectedItemPublishedTime0:linkToElementModel( self, "fileCreateTime", true, function ( model )
		local fileCreateTime = Engine.GetModelValue( model )
		if fileCreateTime then
			FileshareSelectedItemPublishedTime0.PublishTime:setText( Engine.Localize( fileCreateTime ) )
		end
	end )
	self:addElement( FileshareSelectedItemPublishedTime0 )
	self.FileshareSelectedItemPublishedTime0 = FileshareSelectedItemPublishedTime0
	
	local StatLikes = CoD.FileshareStat.new( menu, controller )
	StatLikes:setLeftRight( true, false, 0, 100 )
	StatLikes:setTopBottom( true, false, 53, 71 )
	StatLikes.Icon:setImage( RegisterImage( "uie_t7_icon_menu_options_like" ) )
	StatLikes:subscribeToGlobalModel( controller, "FileshareRoot", nil, function ( model )
		StatLikes:setModel( model, controller )
	end )
	StatLikes:linkToElementModel( self, "fileLikesCount", true, function ( model )
		local fileLikesCount = Engine.GetModelValue( model )
		if fileLikesCount then
			StatLikes.TextBox0:setText( Engine.Localize( SetValueIfNumberIsLessThanOrEqualTo( 0, "0", ShowScaledVotes( fileLikesCount ) ) ) )
		end
	end )
	self:addElement( StatLikes )
	self.StatLikes = StatLikes
	
	local StatDislikes = CoD.FileshareStat.new( menu, controller )
	StatDislikes:setLeftRight( true, false, 106, 206 )
	StatDislikes:setTopBottom( true, false, 53, 71 )
	StatDislikes.Icon:setImage( RegisterImage( "uie_t7_icon_menu_options_dislike" ) )
	self:addElement( StatDislikes )
	self.StatDislikes = StatDislikes
	
	local StatViews = CoD.FileshareStat.new( menu, controller )
	StatViews:setLeftRight( true, false, 212, 312 )
	StatViews:setTopBottom( true, false, 53, 71 )
	StatViews.Icon:setImage( RegisterImage( "uie_t7_icon_menu_options_views" ) )
	self:addElement( StatViews )
	self.StatViews = StatViews
	
	local StatDownloads = CoD.FileshareStat.new( menu, controller )
	StatDownloads:setLeftRight( true, false, 318, 418 )
	StatDownloads:setTopBottom( true, false, 53, 71 )
	StatDownloads.Icon:setImage( RegisterImage( "uie_t7_icon_menu_options_downloads" ) )
	StatDownloads:mergeStateConditions( {
		{
			stateName = "Hidden",
			condition = function ( menu, element, event )
				return not FileshareCanShowDownloadsStats( controller )
			end
		}
	} )
	self:addElement( StatDownloads )
	self.StatDownloads = StatDownloads
	
	self.StatDislikes:linkToElementModel( self, "fileDislikesCount", true, function ( model )
		local fileDislikesCount = Engine.GetModelValue( model )
		if fileDislikesCount then
			StatDislikes.TextBox0:setText( Engine.Localize( SetValueIfNumberIsLessThanOrEqualTo( 0, "0", ShowScaledVotes( fileDislikesCount ) ) ) )
		end
	end )
	self.StatViews:linkToElementModel( self, "fileViewsCount", true, function ( model )
		local fileViewsCount = Engine.GetModelValue( model )
		if fileViewsCount then
			StatViews.TextBox0:setText( Engine.Localize( fileViewsCount ) )
		end
	end )
	self.StatDownloads:linkToElementModel( self, "fileDownloadsCount", true, function ( model )
		local fileDownloadsCount = Engine.GetModelValue( model )
		if fileDownloadsCount then
			StatDownloads.TextBox0:setText( Engine.Localize( fileDownloadsCount ) )
		end
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FileshareSelectedItemAuthor0:close()
		element.FileshareSelectedItemPublishedTime0:close()
		element.StatLikes:close()
		element.StatDislikes:close()
		element.StatViews:close()
		element.StatDownloads:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

